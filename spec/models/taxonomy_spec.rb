require 'rails_helper'

RSpec.describe Taxonomy, type: :model do
  describe '#employee'  do
    let!(:taxonomy) do
      FactoryBot.create(
        :taxonomy,
        taxon_able: FactoryBot.build(:employee)
      )
    end
    
    it 'should return taxon_able as an employee' do
      expect(taxonomy.taxon_able).to be_a_kind_of Employee
    end
    
    it 'should return the employee' do
      expect(taxonomy.employee).to be_a_kind_of Employee
    end
  end

  describe '#gift'  do
    let!(:taxonomy) do
      FactoryBot.create(
        :taxonomy,
        taxon_able: FactoryBot.build(:gift)
      )
    end
  
    it 'should return taxon_able as an employee' do
      expect(taxonomy.taxon_able).to be_a_kind_of Gift
    end
  
    it 'should return the employee' do
      expect(taxonomy.gift).to be_a_kind_of Gift
    end
  end
end
