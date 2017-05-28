class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clients
  has_many :vehicles, through: :clients
  # has_many :policies, through: :clients
  has_many :policies, inverse_of: :user
  has_many :insurers, inverse_of: :user
end
