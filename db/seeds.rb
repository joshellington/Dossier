# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Creating categories...'
Category.destroy_all
Category.create!(:id => 0, :title => 'Technology')
Category.create!(:id => 1, :title => 'Social')
Category.create!(:id => 2, :title => 'News')
Category.create!(:id => 3, :title => 'Brands')
Category.create!(:id => 4, :title => 'Science')
Category.create!(:id => 5, :title => 'Music')
Category.create!(:id => 6, :title => 'Strategy')
Category.create!(:id => 5, :title => 'Other')
puts 'Done.'