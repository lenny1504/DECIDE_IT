class ApprovalFlow < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  has_many :steps
  validates :name, presence: true
end
