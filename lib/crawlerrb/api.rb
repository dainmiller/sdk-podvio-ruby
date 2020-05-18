require 'json'

module Crawlerrb
  class Interface

    def initialize
      @connection = Crawlerrb::Database.new
    end
    
    def subscribe_to(podcast:)
      @connection.fetch podcast
    end
    
    def broadcast podcast
      episodes = Crawlerrb::Extract::Episodes.new(
        for_podcast: podcast
      ).extract!

      @connection.store [podcast, episodes]
    end

    # def subscribe_with callback:, to:
    #   registered_callback = Clients::Remote::Webhook.new(callback_url: URI(callback))
    #   return registered_callback
    # end

    # def subscribe_with callback:, to:
    #   registered_callback = Clients::Remote::Webhook.new(callback_url: URI(callback))
    #   return registered_callback
    # end
    #
    # def episodes_for podcast:
    #   subscribe_to podcast: podcast
    # end
    #
    # def subscribe_with_response podcast:
    #   subscribe_to podcast: podcast
    # end

  end
end