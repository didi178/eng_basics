json.extract! fib, :id, :generated_fibs, :created_at, :updated_at
json.url fib_url(fib, format: :json)
