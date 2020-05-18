# Crawlerrb

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/crawlerrb`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crawlerrb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install crawlerrb

## Usage

1. Configure the crawler backend

Create `crawler.rb` in `config/initializers`

Add the following to the file, with your preferred configs

```ruby
crawler.setup do |config|

  # Define types of crawler, default all
  config.types = :podcasts
  
  # This allows us to abstract the datastore so that you can store
  # the data however you want
  config.data_receipt = DataLoader.new.receive # method to receive data
  
  # Optional value, for us to store the data, so you don't have to worry
  # about receiving the data.
  config.gem_datastore = :sql # options: [:sql, :redis, :datomic]
  
end
```

2. Use the API to crawl podcasts and store the data

For instance, if you have a background job that you want to start
crawling a podcast looking for new episodes, you could use the 
API like this:

```ruby
episodes = CrawlerApi::Interface.new.broadcast "Accidental Tech Podcast"
# => no body results, 200 header to know it started background job
```

Then if you want to subscribe for results, you can do it like this
for immediate results

```ruby
podcasts = CrawlerApi::Interface.new.subscribe "Accidental Tech Podcasts"
# => body results contain list of episodes for podcast
```

or with a callback

```ruby
your_callback_url = "https://api.yourapp.com/new_podcast_content/accidental-tech-podcast"
new_eps_needed_for = "Accidental Tech Podcast"
podcasts = CrawlerApi::Interface.new.subscribe_with_callback new_eps_needed_for, your_callback_url

# => no body results, but data for only that podcast, comes in to your API
```

or for a callback registered for any new episode across all your podcasts

```ruby
your_callback_url = "https://api.yourapp.com/new_podcast_content"
podcasts = CrawlerApi::Interface.new.subscribe_with_callback nil, your_callback_url

# => no body results, but data for all podcasts, comes in to your API
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/crawlerrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/crawlerrb/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Crawlerrb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/crawlerrb/blob/master/CODE_OF_CONDUCT.md).
