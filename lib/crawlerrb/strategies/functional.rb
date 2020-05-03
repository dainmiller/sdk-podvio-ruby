module Strategies
  class Functional < FunctionalCrawlerInterface
  
    def initialize options
      
      if options.podcast
        
        store transform unwrap extract_episodes podcast

      else
        
        store transform unwrap extract_podcasts

      end
      
    end
  
  end
end