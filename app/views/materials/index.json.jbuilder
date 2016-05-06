json.array!(@materiais) do |material|
  json.extract! material, :id, :nome
  json.url material_url(material, format: :json)
end
