class Category < ActiveRecord::Base
  attr_accessible :title

  has_many :links

  default_scope :order => 'title'
end
