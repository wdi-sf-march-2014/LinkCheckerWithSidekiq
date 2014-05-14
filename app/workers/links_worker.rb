class LinksWorker
  include Sidekiq::Worker

  def perform(site_id)
    require 'open-uri'
    site = Site.find(site_id)

    contents = Nokogiri::HTML(open(site.url))
    contents.css('a').each do |link|
      link_href = link.attributes['href'].value
      if (link_href.starts_with? '/')
        link_href = site.url + link_href
      end

      if (link_href.starts_with? 'http://', 'https://')
        response = Typhoeus.get(link_href)

        site.links.create(url: link_href, http_response: response.response_code)
      end

      SiteMailer.status_email(site).deliver
    end
  end
end
