require 'net/http'
require 'uri'

module Crawlerrb
  module Clients
    module Itunes
       class Search
         attr_accessor :results
         def initialize(podcast:)
           request podcast
         end
         def request podcast
           uri = URI("https://itunes.apple.com/search?term=#{podcast}")
           res = Net::HTTP.get(uri)
           @results = JSON.parse(res)
           results = @results
         end
       end
    end
  end
end

