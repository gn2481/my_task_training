FactoryBot.define do
  factory :task do
    title { Faker::Games::Zelda.item }
    # 這個沒什麼意思，就是想讓標題變得像任務一點
    content { Faker::Lorem.sentences}
  end
end
