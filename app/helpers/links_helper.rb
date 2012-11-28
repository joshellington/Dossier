module LinksHelper
  def url_format(url)
    host = URI.parse(url).host
    if host
      host.gsub('www.', '')
    end      
  end

  def embed_media(url)
    allowed = /img|iframe/
    res = auto_html(url) {html_escape; image; youtube(:width => '100%', :height => '400px'); vimeo(:width => '100%', :height => '400px'); soundcloud; twitter; simple_format}

    if res =~ allowed
      res
    else
      false
    end
  end
end
