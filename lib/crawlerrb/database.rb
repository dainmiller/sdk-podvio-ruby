require 'redis'

module Crawlerrb
  class Database

    def self.start
      new
    end

    def initialize
      @connection = Redis.new
    end

    def store data
      podcast, episodes = data[0], data[1]

      @connection.set(podcast, pack(episodes))
    end

    def fetch podcast
      JSON.parse @connection.get podcast
    end

    def pack episodes
      { episodes: episodes }.to_json
    end

  end
end
