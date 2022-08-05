class Group < ApplicationRecord
  belongs_to :user
  has_many :entities
  validates :name, presence: { message: "Name can't be blank!" }
  has_one_attached :image
end
