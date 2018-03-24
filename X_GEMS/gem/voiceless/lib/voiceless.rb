require "voiceless/version"
require 'colorize'

module Voiceless; end

def voiceless
  begin
    yield
  rescue Exception => e
    puts (">"*50).red
    puts e.message.to_s.red
    puts caller[1].split(':')[0..1].join(':').yellow
    puts ("<"*50).red
  end
end