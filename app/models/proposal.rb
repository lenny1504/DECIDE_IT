class Proposal < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ["initiated", "in review", "approved", "rejected"] }

end
