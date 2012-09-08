class PagesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def subscribe
    add_breadcrumb 'Subscribe', subscribe_path

    render 'subscribe'
  end

  def search
    render 'search'
  end

  def about
    text = File.open('./README.md') { |f| f.read }
    @html = BlueCloth.new(text).to_html

    render 'about'
  end

  def help
    render 'help'
  end
end
