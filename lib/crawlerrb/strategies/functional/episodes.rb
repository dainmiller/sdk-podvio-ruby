module Crawlerrb
  module Strategies
    module Functional
      class Episodes < FunctionalCrawlerInterface

        def self.for podcast:
          store transform unwrap extract_episodes podcast
        end

      end
    end
  end
end