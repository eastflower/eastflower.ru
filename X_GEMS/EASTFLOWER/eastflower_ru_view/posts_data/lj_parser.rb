require 'open-uri'
require 'nokogiri'

urls = []

# http://eastflower.livejournal.com/1889.html

50.times do |i|
  content = open("http://eastflower.livejournal.com/?skip=#{ 10 * i }").read
  doc = Nokogiri::HTML(content)
  doc.css('.j-e-title a').each do |node|
    href = node['href']
    urls << href
  end

  puts "page #{ i.next }"
end

urls = urls.uniq.join("\n")

`echo "#{ urls }" > ./urls.txt`

puts "=)"