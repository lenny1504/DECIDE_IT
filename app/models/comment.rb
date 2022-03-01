class Comment < ApplicationRecord
  belongs_to :step
  belongs_to :user
  validates :content, presence: true
end
