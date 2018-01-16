class Comment < ApplicationRecord
  validates :comment, presence: true, length: {minimum: 50}
  belongs_to :question
end
