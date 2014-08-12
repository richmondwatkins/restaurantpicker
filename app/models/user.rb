class User < ActiveRecord::Base
  has_many :reviews

  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"

  validates_length_of :name, maximum: 20, message: "must be less than 20 characters"
  validates_uniqueness_of :name, message: "already exists"
end
