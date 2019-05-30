class City < ApplicationRecord
  has_many :customers
  has_and_belongs_to_many :zipcodes
  has_one :state
end
