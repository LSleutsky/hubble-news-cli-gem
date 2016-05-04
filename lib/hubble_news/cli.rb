class HubbleNews::CLI

  def initialize
    hubble_archives
  end

  def hubble_archives
    # puts "What would you like to do (type 'list' for contents or 'exit' to terminate)? "
    # input = gets.strip

    HubbleNews::Hubble.scrape_hubble_titles
    HubbleNews::Hubble.scrape_hubble_info
  end

end
