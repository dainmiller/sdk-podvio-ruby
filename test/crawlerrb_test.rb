require "test_helper"

class CrawlerrbTest < Minitest::Test
  def setup
    @connection = Crawlerrb::Database.start
  end

  def test_that_it_has_a_version_number
    refute_nil ::Crawlerrb::VERSION
  end

  def test_start_crawler
  end

  def test_return_a_result_from_crawling
  end

  def test_subscribe_to_a_podcast
  end

  def test_subscribe_to_updates_for_a_podcast_with_no_callback
    crawler = Crawlerrb::Api.new
    crawler.broadcast "Accidental Tech Podcast"
    podcast = "Accidental Tech Podcast"
    results = crawler.subscribe_to podcast: podcast
    assert podcast
    assert results
  end

  def test_subscribe_to_updates_for_a_podcast_with_callback
  end
end
