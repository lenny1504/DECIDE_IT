class Log < ApplicationRecord
  belongs_to :step
  validates :original_status, :updated_status, presence: true
end
