class HubbleNews::CLI

  def initialize
    puts "Here are the latest Hubble Space Telescope updates: "
    puts "\n"

    hubble_scraped_info
    run!
  end

  def hubble_scraped_info
    # set the return of the scrape_hubble_titles class method to @archives instance variable
    @archives = HubbleNews::Hubble.scrape_hubble_titles
    # print out each of the news update archives
    @archives.each { |archive| puts "#{archive}" }
    # set the return of the scrape_hubble_teaser class method to @teaser_info instance variable
    @teaser_info = HubbleNews::Hubble.scrape_hubble_teaser
    # set the return of the scrape_hubble_info class method to @full_info instance variable
    @full_info = HubbleNews::Hubble.scrape_hubble_info
  end

  def run!
    input = nil
    puts "\nWhich story would you like to learn more about?"
    puts "(pick a number from the list or type 'exit' to terminate)"

    while input != "exit"
      input = gets.strip.downcase

      if (input.to_i) > 0 && (input.to_i <= @archives.length)
        # print and capitalize the title of the selected archive
        puts "\n#{@archives[input.to_i - 1]}: ".upcase.gsub("#{input.to_i}. ", "")
        # print teaser info text about the archive
        puts "'#{@teaser_info[input.to_i - 1]}'"

        puts "\nWould you like the full story?"
        puts "(type 'more' for full story, 'list' to go back, or 'exit' to quit)"
        answer = gets.strip.downcase

        if answer == "list"
          puts "\n"
          hubble_scraped_info
          puts "\nWhich story would you like to learn more about?"
          puts "(pick a number from the list or type 'exit' to terminate)"
        elsif answer == "more"
          puts "\n#{@full_info[input.to_i - 1]}"
          puts "\nWould you like to go back to the archive, or quit?"
          puts "(type 'list' for archive or 'exit' to quit)"
          answer = gets.strip.downcase

          if answer == "list"
            puts "\n"
            hubble_scraped_info
            puts "\nWhich story would you like to learn more about?"
            puts "(pick a number from the list or type 'exit' to terminate)"
          elsif answer == "exit"
            puts "\nGoodbye! See ya next time, space lover..."
            break
          end
        elsif answer == "exit"
          puts "\nGoodbye! See ya next time, space lover..."
          break
        end
      elsif input == "exit"
        puts "\nGoodbye! See ya next time, space lover..."
        break
      end
    end
  end

end