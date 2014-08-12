class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  
  validates_format_of :description, with: /[a-zA-Z]/, message: "must include letters"
  validates_length_of :description, maximum: 200, message: "must be less than 200 characters"
  validates_presence_of :description
  validates_presence_of :review
  validates_format_of :review, with: /\d+/
end
