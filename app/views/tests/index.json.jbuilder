json.page_info do
  json.per_page @tests.limit_value
  json.total_pages @tests.total_pages
  json.current_page @tests.current_page
end
json.tests do
  json.array! @tests, partial: "tests/test", as: :test
end
