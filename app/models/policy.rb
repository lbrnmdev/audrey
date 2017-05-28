class Policy < ApplicationRecord
  include Sanitizable
  belongs_to :client
  belongs_to :vehicle, optional: true
  belongs_to :user
  belongs_to :insurer
  enum status: [ :not_issued, :issued, :cancelled ]

  before_validation :squish_inputs, :nil_if_blank, :calculate_percentages # remove whitespace and make commission a fraction

  validates_uniqueness_of :number, scope: [:insurer, :user], message: "must be unique to the given insurer"  # There HAS to be a more elegant way of doing this. Currently replaced has_many :through relationship between policy and user with has_many & belongs_to
  validates_presence_of :number, allow_nil: true # TODO validate number to disallow whitespace only input
  validates :start_date, presence: true
  validates :end_date, presence: true # TODO add custom validation to ensure end_date is later than start_date
  validates :premium, presence: true, numericality: { greater_than_or_equal_to: 0, message: "must be number 0 or greater" }
  validates :commission, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be a percentage between 0 and 100" }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be a percentage between 0 and 100" }
  validates :client, presence: true
  validates :insurer, presence: true
  validates :user, presence: true

  private

    def calculate_percentages
      self.commission = self.commission/100
      self.discount = self.discount/100 if self.discount
    end
end
