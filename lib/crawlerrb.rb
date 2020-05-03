require "crawlerrb/version"
require "crawlerrb/interfaces/functional_crawler_interface"
require "crawlerrb/strategies/functional"

module Crawlerrb
  class Error < StandardError; end
  
  class CrawlerApi < FunctionalCrawlerInterface

    class << self
      
      def crawl_for podcast:
        Strategies::Functional.new(
          sequence_for: :episodes,
          podcast: podcast
        )
      end
      
      def self.crawl_for_new_podcasts
        Strategies::Functional.new(
          sequence_for: :podcasts
        )
      end
    
    end
    
  end
  
end

# Create the API that others will use, by mixing in the
# Crawlerrb::CrawlerApi module class to the CrawlerApi 
# class. All this does is allow for a simpler API without
# needing to prefix `Crawlerrb::`.
class CrawlerApi ; end
extend CrawlerApi, Crawlerrb::CrawlerApi