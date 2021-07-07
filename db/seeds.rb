# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザー
User.create!(name:  "isurugikeito",
  email: "keito@gmail.com",
  comment: "はじめまして、こんにちは。",
  password:              "111111",
  password_confirmation: "111111",
  image_name: File.open("app/assets/images/adminicon.png"), 
  admin: true
)

# ゲストユーザー(簡単ログイン用)
User.create!(name:  "ゲストユーザー",
  email: "test@example.com",
  comment: "はじめまして、こんにちは。",
  password:              "111111",
  password_confirmation: "111111",
  image_name: File.open("app/assets/images/gest_icon.png")
)



# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Gimei.name.kanji
  email = "example-#{n+1}@gmail.com"
  password = "password"
  comment = "てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。"
  num = rand(1..6)
  User.create!(
      name:  name,
      email: email,
      comment: comment,
      image_name: File.open("app/assets/images/icon#{num}.png"),
      password:              password,
      password_confirmation: password
    )
end

# レビューを追加
users = User.where(id: 1..60)

users.each do |user|
  sake_rate = 4.0
  content = "スーパードライ。スーパードライ。スーパードライ。スーパードライ。"
  sake_id = 1
  sake_image_name = File.open("app/assets/images/superdry2.jpg")
  user.post_reviews.create!(
    content: content,
    sake_rate: sake_rate,
    sake_id: sake_id,
    sake_image_name: sake_image_name
    )

  sake_rate = 4.5
  content = "ハイボール。ハイボール。ハイボール。ハイボール。ハイボール。ハイボール。"
  sake_id = 2
  sake_image_name = File.open("app/assets/images/tita2.jpg")
  user.post_reviews.create!(
    content: content,
    sake_rate: sake_rate,
    sake_id: sake_id,
    sake_image_name: sake_image_name
    )

  sake_rate = 3.5
  content = "いも。いも。いも。いも。いも。いも。いも。いも。いも。いも。いも。いも。いも。"
  sake_id = 3
  sake_image_name = File.open("app/assets/images/akane2.jpg")
  user.post_reviews.create!(
    content: content,
    sake_rate: sake_rate,
    sake_id: sake_id,
    sake_image_name: sake_image_name
    )

  sake_rate = 5.0
  content = "レモン。レモン。レモン。レモン。レモン。レモン。レモン。レモン。レモン。レモン。レモン。"
  sake_id = 4
  sake_image_name = File.open("app/assets/images/remondo2.jpg")
  user.post_reviews.create!(
    content: content,
    sake_rate: sake_rate,
    sake_id: sake_id,
    sake_image_name: sake_image_name
    )
end


# コメント追加
post_reviews = PostReview.order(:created_at).take(5)
6.times do
  user_id = 2
  content = "テストコメント。テストコメント。"
  post_reviews.each { |post_review| post_review.comments.create!(
    user_id: user_id,
    content: content
    )}
end


# 酒銘柄追加
Sake.create!(
  sake_name:  "スーパードライ",
  sake_type: "ビール",
  sake_maker: "アサヒ",
  sake_image: File.open("app/assets/images/superdry1.jpg")
)

Sake.create!(
  sake_name:  "知多",
  sake_type: "ウィスキー",
  sake_maker: "サントリー",
  sake_image: File.open("app/assets/images/tita1.jpg")
)

Sake.create!(
  sake_name:  "茜霧島",
  sake_type: "焼酎",
  sake_maker: "霧島酒造",
  sake_image: File.open("app/assets/images/akane1.jpg")
)

Sake.create!(
  sake_name:  "檸檬堂　はちみつレモン",
  sake_type: "チューハイ",
  sake_maker: "コカコーラ",
  sake_image: File.open("app/assets/images/remondo1.jpg")
)

# フォロー、フォロワーを追加
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }