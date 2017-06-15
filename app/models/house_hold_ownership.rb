class HouseHoldOwnership < ApplicationRecord
  belongs_to :house_hold
  belongs_to :user
end
