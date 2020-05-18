require 'json'

module Crawlerrb
  class Api

    def initialize
      @connection = Crawlerrb::Database.new
    end

    def broadcast podcast
      episodes = Crawlerrb::Extract::Episodes.new(
        for_podcast: podcast
      ).extract!

      @connection.store [podcast, episodes]
    end

    def subscribe_to(podcast:)
      @connection.fetch podcast
      return episodes_object
    end
  end
end
