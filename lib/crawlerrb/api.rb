require 'json'

module Crawlerrb
  class Api

    def initialize
      @connection = Crawlerrb::Database.new.connection
    end

    def broadcast podcast
      episodes_ary = Crawlerrb::Extract::Episodes.new(
        for_podcast: podcast
      ).extract!

      @connection.set(podcast, {
        episodes: episodes_ary
      }.to_json)
    end

    def subscribe_to(podcast:)
      episodes_object = @connection.get podcast
      episodes_object = JSON.parse(episodes_object)
      return episodes_object
    end
  end
end
