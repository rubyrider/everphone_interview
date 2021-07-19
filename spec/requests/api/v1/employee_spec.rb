require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  describe "PATCH /gift" do
    let!(:employee) { FactoryBot.create(:employee, interests: [FactoryBot.build(:taxonomy, name: 'relax')]) }
    let!(:gift) { FactoryBot.create(:gift, categories: [FactoryBot.build(:taxonomy, name: 'relax')]) }
    
    it "returns assigned gift" do
      patch gift_api_v1_employee_path(employee.id)
      
      expect(JSON(response.body).first['id']).to be == gift.id
    end
  end

end
