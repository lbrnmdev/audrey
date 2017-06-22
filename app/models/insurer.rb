class Insurer < ApplicationRecord
  include Sanitizable
  belongs_to :user
  has_many :policies, inverse_of: :insurer

  before_validation :downcase_attributes, :nil_if_blank, :squish_inputs, :full_website_url

  # TODO validations
  validates :name, presence: true, uniqueness: { scope: :user, message: "already exists for the current user" }
  validates :full_legal_name, presence: true, uniqueness: { scope: :user, message: "already exists for the current user" }
  validates :address, presence: :true, allow_nil: :true
  validates :email_address, presence: :true, allow_nil: :true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, allow_blank: true }
  validates :phone_number, presence: :true, allow_nil: :true
  validates :website, presence: :true, allow_nil: :true, format: { with: URI::regexp(%w(http https)) }
  validates :user, presence: :true

  # return name in all caps
  def name_in_caps
    name.upcase
  end

  private

    # prepend http:// to url if it's not present
    def full_website_url
      self.website = (URI(self.website).scheme ? self.website : ("http://" + self.website)) if self.website
    end
end
