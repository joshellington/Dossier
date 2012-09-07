module LinksHelper
  def url_format(url)
    URI.parse(url).host.gsub('www.', '')
  end
end
