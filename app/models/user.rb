class User < ApplicationRecord
  validates_uniqueness_of :username
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
  has_many :notifications, as: :recipient, dependent: :destroy

end
