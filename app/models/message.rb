class Message < ApplicationRecord
  has_noticed_notifications
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to self.room }
  after_create_commit :notify_user

  def notify_user
    MessageNotification.with(message: self).deliver_later(user)
  #  broadcast_prepend_to :notifications,
  #                        target: "notifications-list",
  #                        partial: "notifications/notification",
  #                        locals: {user:, room: }
  end
end
