class HouseHold < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses, as: :expendable
  has_many :services
  has_many :house_hold_ownerships
  has_many :admins, through: :house_hold_ownerships, source: :user

  accepts_nested_attributes_for :expenses
  accepts_nested_attributes_for :services
end
