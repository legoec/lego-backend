json.extract! service, :id, :name, :price, :vendor
json.average service.recomendations.average(:ranking)
