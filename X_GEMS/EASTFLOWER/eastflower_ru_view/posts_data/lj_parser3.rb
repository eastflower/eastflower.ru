require 'rails'
require 'open-uri'
require 'nokogiri'

urls = File.open('urls.txt').read.split("\n")[0..50]

urls.each do |url|
  puts url

  content = open(url).read
  doc = Nokogiri::HTML(content)

  doc.css('.j-e-tags-item a').each do |tag|
    puts tag.text
  end

end

# http://eastflower.livejournal.com/235960.html