class Group < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image
  belongs_to :user
  has_many :entities, dependent: :delete_all
end
