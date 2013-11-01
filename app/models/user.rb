class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :password, :salt, presence: true

  validates_uniqueness_of :email
end
