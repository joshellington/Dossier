module LinksHelper
  def url_format(url)
    host = URI.parse(url).host
    if host
      host.gsub('www.', '')
    end      
  end
end
