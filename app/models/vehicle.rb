class Vehicle < ApplicationRecord
  belongs_to :client

  # TODO validate attributes
  # TODO validate uniqueness of chassis_no or registration_no??
  validates :year_of_manufacture, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :seating_capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :cubic_capacity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :registration_no, presence: true, format: { with: /\A[a-zA-Z\d]+\z/, message: 'only allows letters and numbers, please enter input without spaces' }
  # TODO further validate format of chassis_no
  validates :chassis_no, presence: true, length: { is: 17, wrong_length: "should be 17 characters in length" }, format: { with: /\A[a-zA-Z\d]+\z/, message: 'only allows letters and numbers, please enter input without spaces' }
  validates :make, presence: true
  validates :model, presence: true

  # TODO standardize input case before save
  # before_save do
    # make.capitalize!
    # model.capitalize!
    # registration_no.upcase!
    # chassis_no.upcase!
    # body_type.upcase!
  # end

  # TODO standardize input case before validations run
  before_validation do
    make.capitalize!
    model.capitalize!
    registration_no.upcase!
    chassis_no.upcase!
    body_type.upcase!
  end

end
