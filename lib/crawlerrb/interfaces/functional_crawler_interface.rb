class FunctionalCrawlerInterface
  
  class << self
    
    def extract_episodes podcast
      Crawlerrb::Extract::Episodes.for(podcast: podcast)
    end
    
    def extract_podcasts
      Crawlerrb::Extract::Podcasts.new
    end
    
    def unwrap
      Crawlerrb::Extract::Unwraper.new
    end
    
    def transform
      Crawlerrb::Transform::Mapper.new
    end
    
    def store
      Crawlerrb::Load::Loader.new
    end    
    
  end
  
end