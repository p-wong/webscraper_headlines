require 'open-uri'
require 'nokogiri'
# require 'pry'

print "How many headlines do you want to view (up to 7)? "
response = gets.chomp
while response.to_i <= 0 || response.to_i > 7
  print "Please enter a number from 1 to 7: "
  response = gets.chomp
end

doc = Nokogiri::HTML(open("https://wsj.com/"))
x = 0
wsj_headings = []
while x < response.to_i
  wsj_headings << "#{x+1}. " + doc.css("a.wsj-headline-link")[x].text
  x += 1
end

doc = Nokogiri::HTML(open("https://www.theverge.com"))
y = 0
verge_headings = []
while y < response.to_i
  verge_headings << "#{y+1}. " + doc.css("h2")[y].text
  y += 1
end

doc = Nokogiri::HTML(open("https://www.businessoffashion.com"))
z = 0
bof_headings = []
while z < 2 && z < response.to_i
  bof_headings << "#{z+1}. " + doc.css("div.container.padded-top.visible-xs").css("h2.no-margin")[z].text
  z += 1
end
while 2 <= z && z < response.to_i
  bof_headings << "#{z+1}. " + doc.css("div.container.padded-top.visible-xs").css("h3.large-font")[z-2].text
  z += 1
end

# binding.pry

puts "\n"
puts " - - - Source: Wall Street Journal - - - "
puts wsj_headings
puts "\n"
puts " - - - Source: The Verge - - - "
puts verge_headings
puts "\n"
puts " - - - Source: Business of Fashion - - - "
puts bof_headings
