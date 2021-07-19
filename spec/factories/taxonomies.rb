FactoryBot.define do
  factory :taxonomy do
    name { Faker::Appliance.equipment }
  end
end
