# Gem Notes
===========
  1. Project: Hubble News CLI Gem
    + **This CLI gem will display updated Hubble Space Telescope news and / or updates.**
    + Website to be scraped is **http://hubblesite.org/newscenter/archive/**.    
    + At first load, ask user if they want to `list` the contents, or `exit` the program.
    + If `list` is entered, then **list** each of the newest Hubble updates.
      + If `exit` is entered, then **terminate** the program.
    + The above **list** should reference - via a number - each individual item, for user selection
    + Prompt user to enter a valid selection for the corresponding **list** item.
    + If invalid selection is entered, keep prompting user via a loop to enter a valid selection.
    + Allow user to type in `exit` at anytime to terminate the program.
    + When a valid selection is made, display corresponding archive information.
      + Ask user if `more` information is wanted, or if they want to `exit` the selected archive and search for others.
        + If more information is wanted, then display more info from corresponding archive update.
        + If user exits selected archive, provide options to view initial `list` of archives, or `exit` completely.

  2. File Structure
    + ./bin folder will contain main executable file called **hubble_news** which executes the CLI.
    + ./lib folder will have hubble_news.rb which will serve as the config/environment file for the entire program.
      + hubble_news.rb will load all the required libraries and ruby files that make up the program.
    + ./lib will contain a hubble_news folder that will house the main code for the cli - **cli.rb**.
      + ./lib/hubble_news will also contain a **hubble.rb** file that will provide helper and / or function methods for **cli.rb.**
      + ./lib/hubble_news will have a **version.rb** file that was auto generated during the `bundle gem` *command line process.*
    + hubble_news.gemspec is an *auto generated file* that houses all necessary dependencies to make the program run.

  3. Project & File Domains
    1. ./bin/hubble_news
      + Introductory text
      + Runs the executable by calling `HubbleNews::CLI.new`
    2. ./lib/hubble_news.rb - *environment file*
      + require `nokogiri`
      + require `open-uri`
      + require `pry`
      + require_relative `./hubble_news/version`
      + require_relative `./hubble_news/cli`
      + require_relative `./hubble_news/hubble`
    3. ./lib/hubble_news/cli.rb
      + `def hubble_scraped_info` which holds necessary scraped information in instance variables
      + `def run` is the method which runs the /bin file, executing prompts in the terminal for the user
    4. ./lib/hubble_news/hubble.rb
      + `def self.scrape_hubble_titles` scrapes the main titles for each news archive
      + `def self.scrape_hubble_teaser` scrapes the blurb of information for each news archive
      + `def self.scrape_hubble_info` scrapes the external location links for the full story page corresponding to each news archive - external links for each archive are located at **http://hubblesite.org/newscenter/archive/releases/year/article_number/**
    5. ./lib/hubble_news/version.rb
      + Gem `VERSION`
