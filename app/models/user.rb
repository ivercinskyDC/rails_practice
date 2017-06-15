class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses, as: :expendable
  has_many :services, foreign_key: 'asignee_id'
  has_and_belongs_to_many :house_holds
  has_many :house_hold_ownerships
  has_many :admin_houses, through: :house_hold_ownerships, source: :house_hold

  accepts_nested_attributes_for :expenses
  accepts_nested_attributes_for :admin_houses

end
