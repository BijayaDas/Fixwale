json.extract! insta_booking, :id, :user_id, :category_id, :description, :date, :time, :hours, :payment_due, :active, :created_at, :updated_at
json.url insta_booking_url(insta_booking, format: :json)