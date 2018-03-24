require 'rails'
require 'open-uri'
require 'nokogiri'

urls = ['http://eastflower.livejournal.com/235960.html']

urls.each do |url|
  puts url

  content = open(url).read
  doc = Nokogiri::HTML(content)

  doc.css('#comments article').each do |comment|
    puts comment.css('.j-c-date-day').first.text
    puts comment.css('.j-c-date-time').first.text

    puts comment.css('.i-ljuser-username').first.text
    puts comment.css('.j-c-text').first.text
    puts "*"*30
  end

end
