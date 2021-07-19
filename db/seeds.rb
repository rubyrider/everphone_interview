# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

employees = JSON(File.read(File.expand_path('employees.json', 'db')))
gifts = JSON(File.read(File.expand_path('gifts.json', 'db')))

employees.each do |employee|
  puts "Creating employee: #{employee['name']}"
  employee_record = Employee.find_or_create_by(name: employee['name'])
  employee['interests'].each do |interest|
    employee_record.interests << Taxonomy.new(name: interest)
  end
end

gifts.each do |gift|
  puts "Creating gift: #{gift['name']}"
  gift_record = Gift.find_or_create_by(name: gift['name'])
  gift['categories'].each do |category|
    gift_record.categories << Taxonomy.new(name: category)
  end
end
