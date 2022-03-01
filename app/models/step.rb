class Step < ApplicationRecord
  belongs_to :approval_flow
  belongs_to :user
  has_many :logs
  validates :status, presence: true, inclusion: { in: ["created", "change request", "approved", "rejected"] }
end
