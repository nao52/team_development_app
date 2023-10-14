user = User.create(
  last_name: "ナゲ",
  first_name: "太郎",
  email:  "example@test.com"
)

# テスト用の記事を30個作成する
30.times do |n|
  Article.create(
    title: "テストタイトル#{n+1}",
    body: "これはテスト用の記事です",
    user_id: user.id
  )
end
