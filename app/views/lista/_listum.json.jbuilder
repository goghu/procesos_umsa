json.extract! listum, :id, :nombre, :descripcion, :borrado, :created_at, :updated_at
json.url listum_url(listum, format: :json)
