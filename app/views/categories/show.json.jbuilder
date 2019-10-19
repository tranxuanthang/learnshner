json.category do
  json.id @category.id
  json.name @category.name
  json.tests do
    json.array! @category.tests, partial: "test", as: :test
  end
end
