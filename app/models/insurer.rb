class Insurer < ApplicationRecord
  include Sanitizable
  belongs_to :user
  has_many :policies, inverse_of: :insurer

  before_validation :downcase_attributes, :nil_if_blank, :squish_inputs

  # TODO validations
  validates :name, presence: true, uniqueness: { scope: :user, message: "already exists for the current user" }
  validates :full_legal_name, presence: true, uniqueness: { scope: :user, message: "already exists for the current user" }
  validates :address, presence: :true, allow_nil: :true
  validates :email_address, presence: :true, allow_nil: :true
  validates :phone_number, presence: :true, allow_nil: :true
  validates :user, presence: :true

  # return name in all caps
  def name_in_caps
    name.upcase
  end
end
