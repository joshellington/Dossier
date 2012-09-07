class PagesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def subscribe
    add_breadcrumb 'Subscribe', subscribe_path

    render 'subscribe'
  end

  def search
    render 'search'
  end
end
