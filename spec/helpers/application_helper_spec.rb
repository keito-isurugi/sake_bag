require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do
    context 'no argument' do
      it 'return 「SAKE BAG」' do
        expect(full_title).to eq("SAKE BAG")  
      end
    end
    
    context 'argument is "ヘルプ"' do
      it 'return 「ヘルプ | SAKE BAG」' do
        expect(full_title("ヘルプ")).to eq("ヘルプ | SAKE BAG")  
      end
    end
    
    
  end
end