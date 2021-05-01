class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :equipments
  has_many :rents

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :user_type, presence: true
  validates :user_type, inclusion: { in: ["User", "Owner"] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
