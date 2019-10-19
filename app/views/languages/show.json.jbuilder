json.language do
  json.id @language.id
  json.name @language.language_code
  json.tests do
    json.array! @language.tests, partial: "test", as: :test
  end
end
