class Client < ApplicationRecord
  belongs_to :user
  has_many :vehicles

  validates_presence_of :lastname
  validates_presence_of :user
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, allow_blank: true }

  # return client name in full name format
  def lastname_other_names
    "#{lastname} #{other_names || ""}"
  end

  def other_names_lastname
    "#{other_names+" " || ""} #{lastname}"
  end
end
