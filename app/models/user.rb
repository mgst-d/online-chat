class User < ApplicationRecord
  validates_uniqueness_of :username
  after_create_commit { broadcast_append_to "users" }
end
