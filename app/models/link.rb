class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :vote_count

  before_create :set_default_vote

  def set_default_vote
    self.vote_count = 1
  end

  def vote(type)
    if type == 'down'
      self.vote_count -= 1
    else
      self.vote_count += 1
    end
  end
end
