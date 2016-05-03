# hubble_news.rb serves as the environment file

# load external libraries
require "nokogiri"
require "open-uri"
require "pry"

# load files
require_relative "./hubble_news/version"
require_relative "./hubble_news/cli"
require_relative "./hubble_news/hubble"
