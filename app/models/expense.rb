class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :house_hold
end
