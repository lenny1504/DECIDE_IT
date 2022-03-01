class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, presence: true
  has_many :proposals
  has_many :approval_flows
  has_many :steps
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
