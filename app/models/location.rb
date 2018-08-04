class Location < ApplicationRecord
  belongs_to :survivor, optional: true
end
