class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end