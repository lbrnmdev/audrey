class Policy < ApplicationRecord
  belongs_to :client
  belongs_to :vehicle, optional: true
  enum status: [ :not_issued, :issued, :cancelled ]
end
