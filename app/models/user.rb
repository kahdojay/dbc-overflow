class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates_presence_of :name, :password
  validates_uniqueness_of :name
end