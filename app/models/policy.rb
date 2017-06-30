class Policy < ApplicationRecord
  include Sanitizable
  belongs_to :client
  belongs_to :vehicle, optional: true
  belongs_to :user
  belongs_to :insurer
  enum status: [ :not_issued, :issued, :cancelled ] # TODO add expired, valid

  before_validation :squish_inputs, :nil_if_blank, :calculate_commission_amount # remove whitespace, calculate commission amount

  validates_uniqueness_of :number, scope: [:insurer, :user], message: "must be unique to the given insurer"  # There HAS to be a more elegant way of doing this. Currently replaced has_many :through relationship between policy and user with has_many & belongs_to
  validates_presence_of :number, allow_nil: true # TODO validate number to disallow whitespace only input
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :end_date_after_start_date
  validates :premium, presence: true, numericality: { greater_than_or_equal_to: 0, message: "must be number 0 or greater" }
  validates :commission, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be a percentage between 0 and 100" }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be a percentage between 0 and 100" }
  validates :client, presence: true
  validates :insurer, presence: true
  validates :user, presence: true
  validates :commission_amount, numericality: { greater_than_or_equal_to: 0 }

  private

    def calculate_commission_amount
      # TODO apply discount to premium
      self.commission_amount = (self.premium * (self.commission/100)) if self.commission
    end

    def end_date_after_start_date
      if end_date < start_date
        errors.add :end_date, "has to be same as or after Start date"
      end
    end

end
