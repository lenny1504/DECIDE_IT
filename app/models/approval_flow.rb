class ApprovalFlow < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id, primary_key: :id
  belongs_to :proposal
  has_many :steps
  has_many :comments through: :steps # @approval_flow.comment
  validates :name, presence: true
end
