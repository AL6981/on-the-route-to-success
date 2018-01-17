class Question < ApplicationRecord
  validates :title, presence: true, length: {minimum: 20, message: 'Must be at least 20 characters long!'}
  validates :description, presence: true, length: {minimum: 50}
  has_many :comments, dependent: :destroy
end
