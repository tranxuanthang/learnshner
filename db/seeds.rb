# coding: utf-8
c1 = Category.create! name: "Daily Life",
                description: "Words related to daily life."
c2 = Category.create! name: "IT",
                description: "Words related to information technology."

l1 = Language.create! language_code: "en"
l2 = Language.create! language_code: "ja"
l3 = Language.create! language_code: "de"

u1 = User.create! name: "Thang", email: "thang@gmail.com",
            password: "421998", password_confirmation: "421998"

t1 = u1.tests.create! category_id: c1.id, language_id: l1.id,
                 name: "Your life", description: "Lorem Ipsum"
qarr = ["lifetime", "living", "aliveness", "lifespan", "biography", "sprightliness", "spirit", "liveliness", "animation", "life story", "life history", "lifestyle", "society", "family", "lifestyles", "career", "lifelong", "lifetimes", "death", "livelihood"]
qans = ["trọn đời", "sống", "sống động", "tuổi thọ", "tiểu sử", "tính ổn định", "tinh thần", "sự sống động", "hoạt hình", "câu chuyện cuộc sống", "lịch sử cuộc sống", "lối sống" , "Xã hội", "gia đình", "lối sống", "sự nghiệp", "trọn đời", "cuộc sống", "cái chết", "sinh kế"]
(0..19).each do |i|
  t1.questions.create! content: qarr[i], answer: qans[i]
end

t2 = u1.tests.create! category_id: c2.id, language_id: l1.id,
                      name: "IT is life", description: "Ipsum lorem"
qarr2 = ["engineering", "applied science", "engineering science", "innovation", "tech", "technological", "computing", "informatics", "biotechnology", "science", "telematics", "industry", "expertise", "research", "techniques", "equipment", "computer", "technique", "computerized", "scientific"]
qans2 = ["Kỹ thuật", "khoa học ứng dụng", "khoa học kỹ thuật", "đổi mới", "công nghệ", "công nghệ", "điện toán", "tin học", "công nghệ sinh học", "khoa học", "viễn thông", "công nghiệp" , "chuyên môn", "nghiên cứu", "kỹ thuật", "thiết bị", "máy tính", "kỹ thuật", "máy tính", "khoa học"]
(0..19).each do |i|
  t2.questions.create! content: qarr2[i], answer: qans2[i]
end
