class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Entry
  def initialize(title)
    @title = title
  end
  attr_reader :title
end

def scrape_reddit
  require 'open-uri'
  doc = Nokogiri::HTML(open("https://www.reddit.com/r/Showerthoughts/new"))

  entries = doc.css('.entry')
  @entriesArray = []
  entries.each do |entry|
    title = entry.css('p.title>a').text
    @entriesArray << Entry.new(title)
  end

  render template: 'scrape_reddit'
end

end
