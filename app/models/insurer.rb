class Insurer < ApplicationRecord
  include Sanitizable
  belongs_to :user

  before_validation :downcase_attributes, :nil_if_blank, :squish_inputs

  # TODO validations
  validates :name, presence: true, uniqueness: { scope: :user, message: "already exists" }
  validates :full_legal_name, presence: true, uniqueness: { scope: :user, message: "already exists" }
  validates :address, presence: :true, allow_nil: :true
  validates :email_address, presence: :true, allow_nil: :true
  validates :phone_number, presence: :true, allow_nil: :true
end
