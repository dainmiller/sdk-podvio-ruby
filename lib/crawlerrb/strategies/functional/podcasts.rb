module Crawlerrb
  module Strategies
    module Functional
      class Podcasts < FunctionalCrawlerInterface

        def initialize
          store transform unwrap extract_podcasts
        end

      end
    end
  end
end