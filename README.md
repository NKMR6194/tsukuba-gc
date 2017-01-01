# tsukuba-gc

つくば市がPDFで配布しているごみ収集カレンダーを解析して、JSON形式で出力する

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tsukuba-gc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsukuba-gc

## Usage

### Example CLI

    $ tsukuba-gc 28north.pdf 2016 -o 28north.json

Type "tsukuba-gc –-help" for all available options.

### Example Library

```ruby
require 'tsukuba-gc'

Tsukuba::GC.parse(2016, "28north.pdf") #=> [schedule, ...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/NKMR6194/tsukuba-gc.

