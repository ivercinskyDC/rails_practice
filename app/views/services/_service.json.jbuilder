json.extract! service, :id, :name, :description, :due_date, :amount, :asignee_id, :created_at, :updated_at
json.url service_url(service, format: :json)
