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
end

Crawler = Crawlerrb
Database = Crawlerrb::Database

class CrawlerApiTransaction
  # TODO: Implement this transaction
  def self.start
    yield
  end
end
