require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe '#interests' do
    let!(:employee) do
      FactoryBot.create(
        :employee,
        interests: [FactoryBot.build(:taxonomy)]
      )
    end
    
    it 'should decide to have interests' do
      expect(employee.interests.size).to be == 1
    end
  end
end
