class HubbleNews::CLI

  def initialize
    puts "Here are the latest Hubble Space Telescope updates: "
    puts "\n"
    hubble_news
  end

  def hubble_news
    # set the return of the scrape_hubble_titles instance method to @archives instance variables
    @archives = HubbleNews::Hubble.scrape_hubble_titles
    # print out each of the news update archives
    @archives.each { |archive| puts "#{archive}" }
    # set the return of the scrape_hubble_teaser instance method to @teasers instance variable
    @teasers = HubbleNews::Hubble.scrape_hubble_teaser
    @info = HubbleNews::Hubble.scrape_hubble_info
    binding.pry
    input = nil
    while input != "exit"
      puts "\n"
      puts "Which story would you like to learn more about? (pick a number or type 'exit' to terminate) "
      input = gets.strip.downcase

      if input.to_i > 0
        puts "\n"
        puts "#{@archives[input.to_i - 1]}".upcase
        puts "'#{@teasers[input.to_i - 1]}'"
      end
    end
  end

end
