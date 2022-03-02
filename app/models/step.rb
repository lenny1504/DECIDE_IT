class Step < ApplicationRecord
  belongs_to :approval_flow
  belongs_to :approver, class_name: "User", foreign_key: :user_id, primary_key: :id
  has_many :logs
  has_many :comments
  validates :status, presence: true, inclusion: { in: ["created", "change request", "approved", "rejected"] }
end
