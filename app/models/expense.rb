class Expense < ApplicationRecord
  belongs_to :expendable, polymorphic: true
end
