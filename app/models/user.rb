class User < ActiveRecord::Base
  validates :login, :password, presence: true
end
