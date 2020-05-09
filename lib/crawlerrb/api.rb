require 'json'

module Crawlerrb
  class Interface

    def initialize
    def subscribe_to podcast:
      episodes_object = @connection.get podcast
      episodes_object = JSON.parse(episodes_object)
      return episodes_object
    end

    def subscribe_with callback:, to:
      registered_callback = Clients::Remote::Webhook.new(callback_url: URI(callback))
      return registered_callback
    end
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

    # TODO: Refactor to contain an object representation that 
    # normalizes the data, beyond iTunes normalization
    def subscribe_to podcast:
      episodes_object = @connection.get podcast
      episodes_object = JSON.parse(episodes_object)
      return episodes_object
    end

    def subscribe_with callback:, to:
      registered_callback = Clients::Remote::Webhook.new(callback_url: URI(callback))
      return registered_callback
    end

    def episodes_for podcast:
      subscribe_to podcast: podcast
    end

    def subscribe_with_response podcast:
      subscribe_to podcast: podcast
    end

  end
end