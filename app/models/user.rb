class User < ActiveRecord::Base
  has_many :searches

  def self.upsert!(discord_user)
    find_or_create_by(
      id: discord_user.id,
    ).tap do |user|
      user.update_with_discord_user(discord_user)
    end
  end

  def self.add(user)
    create!(id: user.id, name: user.username)
  end

  def self.allowed?(user)
    exists?(id: user.id, blocked: false)
  end

  def self.blocked?(user)
    exists?(id: user.id, blocked: true)
  end

  def self.block(discord_user)
    upsert!(discord_user)
      .update!(blocked: true)
  end

  def self.unblock(discord_user)
    upsert!(discord_user)
      .update!(blocked: false)
  end

  def searches_count
    searches.count
  end

  def update_with_discord_user(user)
    update!(name: user.username)
  end

  def discord
    @on_discord ||= BOT.users[id]
  rescue RuntimeError
    nil
  end

  delegate :avatar_url, to: :discord, allow_nil: true
end
