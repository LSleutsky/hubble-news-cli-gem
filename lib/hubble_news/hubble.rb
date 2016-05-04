class HubbleNews::Hubble

  attr_accessor :name

  def self.scrape_all

  end

  # scraper for the main title of archive
  def self.scrape_hubble_titles
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))

    title = self.new
    title.name = page.search("li.release-list .release-list-item .text-holder .release-title a").collect.with_index(1) do |titles, i|
      puts "#{i}. #{titles.text}"
    end

    title
  end

  # scraper for archive teaser info
  def self.scrape_hubble_info
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))

    info = self.new
    info.name = page.search("li.release-list .release-list-item .text-holder .release-teaser").collect.with_index(1) do |info, i|
      puts "#{i}. #{info.text.strip}".gsub("(More)", "")
    end
  end

  # scraper for "more" info page
  def self.scrape_hubble_more_info

  end

end
