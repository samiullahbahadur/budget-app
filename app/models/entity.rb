class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: { message: "Name can't be blank!" }
  validates :amount, presence: { message: 'Amount must be greater than Zero (0)' }
end
