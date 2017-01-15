class Client < ApplicationRecord
  belongs_to :user

  validates_presence_of :lastname
  validates_presence_of :user
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, allow_blank: true }
end
