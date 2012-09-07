task :populate => :environment do
  Category.destroy_all
  Category.create!(:id => 0, :title => 'Development')
  Category.create!(:id => 1, :title => 'Design')
  Category.create!(:id => 2, :title => 'Marketing')
  Category.create!(:id => 3, :title => 'General') 
end

task :clear_links => :environment do
  Link.destroy_all
end