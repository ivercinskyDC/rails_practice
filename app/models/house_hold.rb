class HouseHold < ApplicationRecord
  belongs_to :master, class_name: "User"
  has_and_belongs_to_many :users
  has_many :expenses
  has_many :services
end
