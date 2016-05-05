class HubbleNews::Hubble

  attr_accessor :name, :teaser_info, :story

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

    teaser = self.new
    teaser.teaser_info = page.search("li.release-list .release-list-item .text-holder .release-teaser").collect do |paragraph|
      "#{paragraph.text.strip}".gsub("(More)", "")
    end
  end

  # scraper for "more" info page
  def self.scrape_hubble_info
    page = Nokogiri::HTML(open("http://hubblesite.org/newscenter/archive/"))
    # the href attribute of each link contains the location of each news title archive, arranged by year and reference number
    href = page.css("li.release-list .release-list-item .text-holder .release-title a")

    # gather all the links for the full story of each archive
    links = href.collect do |hyperlink|
      hyperlink.attribute("href")
      @site = "http://hubblesite.org#{hyperlink.attr("href")}"
    end

    # let nokogiri to cycle through each link and scrape necessary info from each page for corresponding archive
    doc = links.collect do |link|
      @domain = Nokogiri::HTML(open(link))
      full_info = self.new
      full_info.story = @domain.search("div#news-release .news-release-container #news-release-body p").text.strip
    end
  end

end
