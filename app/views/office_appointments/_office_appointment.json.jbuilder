json.extract! office_appointment, :id, :description, :date, :time, :hours, :payment_due, :active, :created_at, :updated_at
json.url office_appointment_url(office_appointment, format: :json)