require 'nokogiri'

module Crawlerrb
  module Extract
    class Episodes

      def initialize(for_podcast:)
        @podcast = for_podcast
      end

      def extract!
        search = Crawlerrb::Clients::Itunes::Search.new(
          podcast: @podcast
        )

        feedUrl  = search.results.fetch('results')[0].fetch('feedUrl')
        xml      = Nokogiri::XML(Net::HTTP.get(URI(feedUrl)))
        channel  = xml.at("rss").at("channel")
        @items   = channel.xpath("//item") if channel

        @items   = @items.map { |e|
          {
            title: e.at('title').content,
            published: true,
            published_at: e.at('pubDate').content,
            streaming_url: e.at('enclosure').attr('url'),
            guid: e.at('guid').content
          }
        }

        return @items
      end

    end
  end
end
