require 'rails_helper'

class User
  def initialize(name:, age:)
    @name = name 
    @age = age
  end
  def greet
    if @age <= 12
      "ぼくは#{@name}だよ。"
    else
      "僕は#{@name}です。"
    end
  end
  def child?
    @age <= 12
  end
end

RSpec.describe User do
  let(:user) { User.new(name: 'たろう', age: age) }
  shared_context '12歳の場合' do
    let(:age) { 12 }
  end
  shared_context '13歳の場合' do
    let(:age) { 13 }
  end

  describe '#greet' do
    subject { user.greet }
    context '12歳以下の場合' do
      include_context '12歳の場合' 
      it { is_expected.to eq 'ぼくはたろうだよ。' }
    end
    context '13歳以上の場合' do
      include_context '13歳の場合' 
      it { is_expected.to eq '僕はたろうです。' }
    end
  end
  
  describe '#child?' do
    subject { user.child? }
    context '12歳以下の場合' do
      include_context '12歳の場合' 
      it { is_expected.to eq true }
    end
    context '13歳以上の場合' do
      include_context '13歳の場合' 
      it { is_expected.to eq false }
    end
  end
end



