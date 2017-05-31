class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses
  has_many :services
  has_one :managed_house_hold, :class_name => "HouseHold"
  has_and_belongs_to_many :house_holds
end
