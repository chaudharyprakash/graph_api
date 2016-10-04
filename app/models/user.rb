class User < ApplicationRecord
	attr_accessor :password, :password_confirmation
	has_one :picture, as: :imageable
  has_many :articles, :dependent => :destroy
  accepts_nested_attributes_for :picture
end
