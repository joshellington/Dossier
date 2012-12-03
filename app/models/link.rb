class Link < ActiveRecord::Base
  attr_accessible :category_id, :click_count, :body, :title, :url, :vote_count, :user_id

  has_time_span_scopes
  
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable

  before_create :set_default_values

  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI::regexp(%w(http https))}
  validates :title, :presence => true

  # self.per_page = 30

  def set_default_values
    self.vote_count ||= 0
    self.click_count ||= 0
  end

  def vote(type)
    if type == 'down'
      self.vote_count -= 1
    else
      self.vote_count += 1
    end
  end

  def click
    self.increment!(:click_count)
  end
end
