class Log < ApplicationRecord
  belongs_to :step
  belongs_to :user
  validates :original_status, :updated_status, presence: true
end
