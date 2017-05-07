class Policy < ApplicationRecord
  belongs_to :client
  enum status: [ :not_issued, :issued, :cancelled ]
end
