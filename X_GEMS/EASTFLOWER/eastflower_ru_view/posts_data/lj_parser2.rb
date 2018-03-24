require 'rails'
require 'open-uri'
require 'nokogiri'

urls = File.open('urls.txt').read.split("\n")

urls.each do |url|
  puts url

  content = open(url).read
  doc = Nokogiri::HTML(content)

  title = doc.css('.j-e-title a').try(:first).try(:text)
  first_image =  doc.css('.j-e-text img:not(.i-ljuser-userhead)').try(:first).try(:[], 'src')

  doc = Nokogiri::HTML( doc.css('.j-e-text').first.inner_html )
  doc.css('.lj-like').remove
  post_content =  doc.css('body').inner_html

  puts title
  puts first_image
  puts post_content.split('<a name="cutid1"></a>').size
  puts '*'*30
end