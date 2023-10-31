FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "テストタイトル#{n}" }
    body { "これはテスト用の記事です" }
    association :user
  end
end
