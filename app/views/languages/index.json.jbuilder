json.categories do
  json.array! @languages, partial: "language", as: :language
end
