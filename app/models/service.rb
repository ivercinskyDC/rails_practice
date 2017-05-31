class Service < ApplicationRecord
  belongs_to :asignee, class_name: "User"
  belongs_to :house_hold
end
