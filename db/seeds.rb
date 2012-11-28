# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Creating categories...'
Category.destroy_all
Category.create!(:id => 0, :title => 'Development')
Category.create!(:id => 1, :title => 'Design')
Category.create!(:id => 2, :title => 'Marketing')
Category.create!(:id => 3, :title => 'General')
puts 'Done.'