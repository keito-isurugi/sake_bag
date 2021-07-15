require 'rails_helper'

RSpec.describe 'matcher' do
  it 'sample' do
    expect(1 + 2).to eq 3
    expect(1 + 3).to_not eq 3
    expect(1 + 2).to be >= 3
    expect([]).to be_empty
    expect([].empty?).to eq true
    expect([].empty?).to be true
    expect(1).to be_truthy
    expect(nil).to be_falsey
    # どちらも失敗する
    # expect(1).to be true
    # expect(nil).to be false
    x = [1, 2, 3]
    expect(x.size).to eq 3
    x.pop
    expect(x.size).to eq 2
    x = [1, 2, 3]
    expect{ x.pop }.to change{ x.size }.from(3).to(2)  
    x = [1, 2, 3]
    expect{ x.pop }.to change{ x.size }.by(-1)
    expect{ x.push(101) }.to change{ x.size }.by(1)
    expect(x).to include 1, 101
    expect{ 1 / 0 }.to raise_error ZeroDivisionError
  end
end



