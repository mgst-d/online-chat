class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  after_create_commit :broadcast_to_recipient
  #{ broadcast_append_to "notifications" }
  #
  def broadcast_to_recipient
    broadcast_append_later_to(
      recipient,
      :notifications,
      target: 'notifications',
      partial: 'notifications/notification',
      locals: { notification: self }
    )
  end
end
