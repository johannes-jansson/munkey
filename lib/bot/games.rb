# frozen_string_literal: true

module Bot
  module Games
    extend Discordrb::EventContainer
    extend Discordrb::Commands::CommandContainer

    command :games do |event|
      event << "Games:"
      event.server.games.order(:name).all.each do |role|
        event << ".#{role.name.downcase}"
      end

      event << ""
      event << "To get a role just reply with the role, your message will be deleted when you get the role."
      event << "Example; .#{event.server.games.first&.name&.downcase || "stockholm"}"
    end

    command :creategame, ADMIN_PERMISSIONS do |event, name|
      next if event.server.games.exists?(name: name)
      discord_role = event.server.create_role
      discord_role.name = name
      game = Game.upsert!(discord_role)

      "Created game #{game.name}"
    end

    command :removegame, ADMIN_PERMISSIONS do |event, name|
      game = event.server.games.find_by_name(name)

      unless game
        "Game #{name} not found"
      else
        discord_role = event.server.role(game.id)
        discord_role.delete if discord_role
        game.destroy

        "Removed game #{game.name}"
      end
    end

    server_role_update do |event|
      if Game.exists?(event.role.id)
        Game.upsert!(event.role)
      end
    end

    server_role_delete do |event|
      if Game.exists?(event.id)
        Game.destroy(event.id)
      end
    end

    message start_with: "." do |event|
      if event.message.content =~ /\.(.+)/
        if (role = event.server.games.where(name: $1).first)
          # Remove other game roles
          existing_game_roles = event.user.roles.collect(&:id) & event.server.games.pluck(:id)

          # Add new game role
          event.user.modify_roles(role.id, existing_game_roles)
          event.message.delete
        end
      end
    end
  end
end
