require 'rails_helper'

RSpec.describe Gift, type: :model do
  describe '#categories' do
    let!(:gift) do
      FactoryBot.create(
        :gift,
        categories: [FactoryBot.build(:taxonomy)]
      )
    end
    
    it 'should decide to have interests' do
      expect(gift.categories.size).to be == 1
    end
  end
end
