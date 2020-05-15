json.services do
  json.array! @services, partial: 'service', as: :service
end
json.meta do
  json.total_count @total_count
end
