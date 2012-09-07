class Link < ActiveRecord::Base
  attr_accessible :category_id, :click_count, :body, :title, :url, :vote_count

  has_time_span_scopes
  
  belongs_to :category

  before_create :set_default_values

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
end
