json.tests do
  json.array! @tests, partial: "tests/test", as: :test
end
