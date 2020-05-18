require 'net/http'
require 'uri'

module Crawlerrb
  module Clients
    module Itunes

       class Search
         attr_accessor :results

         def initialize(podcast:)
           @podcast = podcast
           execute
         end

         def execute
           results
         end

         def url
           URI("https://itunes.apple.com/search?term=#{@podcast}")
         end

         def results
           parse Net::HTTP.get url
         end

         def parse response
           JSON.parse response
         end
       end
    end
  end
end

