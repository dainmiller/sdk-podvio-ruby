require "crawlerrb/version"
require "crawlerrb/api"
require "crawlerrb/database"
require "crawlerrb/extract/episodes"
require "crawlerrb/clients/itunes/search"
# require "crawlerrb/interfaces/functional_crawler_interface"
# require "crawlerrb/strategies/functional/episodes"
# require "crawlerrb/strategies/functional/podcasts"

module Crawlerrb
  class Error < StandardError; end

  class CrawlerApi

    class << self

      def crawl_for_new_episodes podcast:
        Strategies::Functional::Episodes.for podcast: podcast
      end

      def self.crawl_for_new_podcasts
        Strategies::Functional::Podcasts.new
      end

    end
  end

end

Crawler = Crawlerrb
Database = Crawlerrb::Database
