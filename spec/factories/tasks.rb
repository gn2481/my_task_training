FactoryBot.define do
  factory :task do
    # 這個沒什麼意思，就是想讓標題變得像任務一點
    title { Faker::Games::Zelda.item }
    content { Faker::Lorem.sentences}
  end
end
