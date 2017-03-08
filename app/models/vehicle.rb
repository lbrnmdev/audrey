class Vehicle < ApplicationRecord
  belongs_to :client
  # TODO validate attributes before save
end
