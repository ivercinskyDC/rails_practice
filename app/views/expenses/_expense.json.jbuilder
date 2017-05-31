json.extract! expense, :id, :expense_data, :name, :amount, :description, :created_at, :updated_at
json.url expense_url(expense, format: :json)
