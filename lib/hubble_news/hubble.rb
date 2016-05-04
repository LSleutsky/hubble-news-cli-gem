class HubbleNews::Hubble

  attr_accessor :name

  # scraper for the main title of archive
  def self.scrape_hubble_titles
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))

    title = self.new
    title.name = page.search("li.release-list .release-list-item .text-holder .release-title a").collect.with_index(1) do |titles, i|
      "#{i}. #{titles.text}"
    end
  end

  # scraper for archive teaser info
  def self.scrape_hubble_teaser
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))

    info = self.new
    info.name = page.search("li.release-list .release-list-item .text-holder .release-teaser").collect do |info|
      "#{info.text.strip}".gsub("(More)", "")
    end
  end

  # scraper for "more" info page
  def self.scrape_hubble_info
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))
    href = page.search("li.release-list .release-list-item .text-holder .release-teaser a").attr("href")
    url = Nokogiri::HTML(open("http://hubblesite.org/#{href}"))
  end

end
