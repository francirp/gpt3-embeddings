require 'bundler/setup'
require 'watir'
require 'webdrivers'
require 'nokogiri'
require 'pry'

browser = Watir::Browser.new
browser.goto 'https://success.guideline.com/helpcenter/s/article/difference-between-401k-and-IRA'

parsed_page = Nokogiri::HTML(browser.html)

title = parsed_page.search("h1").first
body_text = parsed_page.css(".slds-rich-text-editor__output").first
binding.pry

File.open("parsed.txt", "w") { |f| f.write "#{parsed_page}" }

browser.close