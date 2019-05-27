class Zipcode < ApplicationRecord
  has_and_belongs_to_many :cities
end
