class ApprovalFlow < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id, primary_key: :id
  belongs_to :proposal
  has_many :steps
  validates :name, presence: true
end
