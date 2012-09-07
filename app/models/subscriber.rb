class Subscriber < ActiveRecord::Base
  attr_accessible :email, :frequency

  before_create :set_default_values

  def set_default_values
    self.frequency ||= 'weekly'
  end
end
