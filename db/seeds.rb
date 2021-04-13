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
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

users = User.order(:created_at).take(6)
35.times do
  sake_name = "アサヒスーパードライ"
  sake_rate = 4.0
  content = "最高の一品。また飲みたいと思った今日このごろ"
  users.each { |user| user.post_reviews.create!(
    content: content,
    sake_name: sake_name,
    sake_rate: sake_rate
    )}
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }