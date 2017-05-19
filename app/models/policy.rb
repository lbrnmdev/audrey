class Policy < ApplicationRecord
  belongs_to :client
  belongs_to :vehicle, optional: true
  belongs_to :user
  enum status: [ :not_issued, :issued, :cancelled ]

  validates_uniqueness_of :number, scope: :user_id  # There HAS to be a more elegant way of doing this. Currently replaced has_many :through relationship between policy and user with has_many & belongs_to
  # TODO validate number to disallow whitespace only input
end
