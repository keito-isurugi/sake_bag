# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザー
User.create!(name:  "石動慧斗",
  email: "keito@gmail.com",
  password:              "111111",
  password_confirmation: "111111",
  admin: true)

# ゲストユーザー(簡単ログイン用)
User.create!(name:  "ゲストユーザー",
  email: "test@example.com",
  comment: "はじめまして、こんにちは。",
  password:              "111111",
  password_confirmation: "111111",)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@gmail.com"
password = "password"
comment = "てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。てすと。"
User.create!(name:  name,
    email: email,
    comment: comment,
    password:              password,
    password_confirmation: password)
end

# レビューを追加
users = User.order(:created_at).take(6)
35.times do
  sake_rate = 4.0
  content = "最高の一品。また飲みたいと思った今日このごろ"
  sake_id = 1
  users.each { |user| user.post_reviews.create!(
    content: content,
    sake_rate: sake_rate,
    sake_id: sake_id
    )}
end

# 酒銘柄追加
Sake.create!(
  sake_name:  "スーパードライ",
  sake_type: "ビール",
  sake_maker: "アサヒ"
)
Sake.create!(
  sake_name:  "知多",
  sake_type: "ウィスキー",
  sake_maker: "サントリー"
)

# フォロー、フォロワーを追加
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }