class Proposal < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id, primary_key: :id
  has_one :approval_flow
  has_many :steps, through: :approval_flow
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ["initiated", "in review", "approved", "rejected"] }
end
