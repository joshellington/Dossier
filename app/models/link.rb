class Link < ActiveRecord::Base
  attr_accessible :category_id, :click_count, :body, :title, :url, :vote_count

  has_time_span_scopes
  
  belongs_to :category

  before_create :set_default_values
  before_save :check_for_duplicate

  validates :url, :presence => true, :format => {:with => URI::regexp(%w(http https))}
  validates :title, :presence => true

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
    self.click_count += 1
  end

  def check_for_duplicate
    l = Link.find_by_url(self.url)

    if l
      false
    else
      true
    end
  end
end
