class Insurer < ApplicationRecord
  belongs_to :user

  before_validation :downcase_attributes

  # TODO validations
  validates :name, presence: true, uniqueness: { scope: :user, message: "already exists" }
  validates :full_legal_name, presence: true, uniqueness: { scope: :user, message: "already exists" }
  validates :address, presence: :true, allow_nil: :true
  validates :email_address, presence: :true, allow_nil: :true
  validates :phone_number, presence: :true, allow_nil: :true

  private

    def downcase_attributes
      self.attributes.each {|attribute, value| self[attribute] = value.downcase if value.respond_to? 'downcase'}
    end
end
