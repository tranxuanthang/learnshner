3.times do |t|
  Category.create name: "Category_#{t.to_s}"
  end
3.times do |t|
  Language.create language_code: "Language_#{t.to_s}"
end

User.first.tests.create name: "Test 1", category_id: 1, language_id: 1 if User.first
