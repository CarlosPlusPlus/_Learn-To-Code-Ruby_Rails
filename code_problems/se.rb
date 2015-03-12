require 'json'
require 'nokogiri'
require 'watir-scroll'
require 'watir-webdriver'

class Listing
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def price
    @price ||= link.at_css('h6')
               .content.gsub(/[^0-9]/, '' ).to_i
  end

  def attributes
    @attributes ||= { :listing_class => listing_class,
                      :address => address,
                      :unit => unit,
                      :url => 'http://streeteasy.com' + url,
                      :price => price }
  end

  private

  def url
    @url ||= link.at_css('.details a')['href']
  end

  def address
    @address ||= if is_townhouse?
        generatic_address
      else
        generatic_address.split(' ')[0...-1].join(' ')
      end
  end

  def unit
    @unit ||= if is_townhouse? || is_rental?
        ''
      else
        generatic_address.split(' ').last.gsub('#', '')
      end
  end

  def listing_class
    @listing_class ||= url.split('/')[2]
  end

  def is_townhouse?
    url.split('/').last.split('-')[1] == 'townhouse'
  end

  def generatic_address
    link.at_css('.details a').content
  end

  def is_rental?
    url.split('/')[2] == 'rental'
  end
end

class StreetEasyScraper
  attr_reader :amount, :browser, :links, :listings, :top_listings, :type

  def initialize(browser, amount = 20)
    @type     = browser['rent'] || 'sale'
    @amount   = amount

    @browser  = Watir::Browser.start(browser)
  end

  def scrape
    @links        = get_links
    @listings     = get_listings
    @top_listings = sort_listings
  end

  def to_json
    File.open("#{type}.json", 'w') do |file|
      file.write(top_listings.to_json)
    end
  end

  private

  def get_links
    browser.scroll.to [0,5000000]
    sleep(2)
    browser.scroll.to [0,5000000]
    page = Nokogiri::HTML.parse(browser.html)
    page.css('.item_inner')
  end

  def get_listings
    links.collect { |link| Listing.new(link) }
  end

  def sort_listings
    sorted_listings = listings.sort { |a,b| b.price <=> a.price }
    sorted_listings.map! { |listing| listing.attributes }
    sorted_listings[0...amount]
  end
end

############
# Solution #
############

rent = StreetEasyScraper.new('http://streeteasy.com/nyc/for-rent/soho')
rent.scrape
rent.to_json

sale = StreetEasyScraper.new('http://streeteasy.com/nyc/for-sale/soho')
sale.scrape
sale.to_json
