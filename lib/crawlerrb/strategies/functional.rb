module Strategies
  class Functional < FunctionalCrawlerInterface
  
    def initialize sequence_for:, podcast=nil
      if :podcasts
        store transform unwrap extract_podcasts
      end
    
      if :episodes
        store transform unwrap extract_episodes podcast
      end
    end
  
  end
end