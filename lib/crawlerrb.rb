require "crawlerrb/version"
Crawlerrb.crawl { 
  
}
module Crawlerrb
  class Error < StandardError; end
  
  def self.crawl &block
    klass = Class.new
    klass.send :include, Crawler::Extract
    klass.new.crawl &block
  end
  
  def self.configure
    yield self
  end
  
  def self.set_proxy *args
    @proxy_args = args
  end
  
  def set_user_agent user_agent
    @user_agent = user_agent
  end
  
  alias_method :scrape, :crawl
end
