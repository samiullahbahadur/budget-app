class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :groups, dependent: :delete_all
  has_many :entities, dependent: :delete_all
  has_one_attached :avatar
end
