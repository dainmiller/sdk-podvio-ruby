require 'redis'

module Crawlerrb
  class Database
    attr_accessor :connection

    def self.start
      new
    end

    def initialize
      @connection = Redis.new
    end

  end
end
