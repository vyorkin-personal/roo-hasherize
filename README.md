[![Build Status](https://travis-ci.org/vyorkin/roo-hasherize.svg)](https://travis-ci.org/vyorkin/roo-hasherize)

# roo-hasherize

Built on top of the roo gem for easy abstraction of
spreadsheet types supported by [roo](https://github.com/roo-rb/roo) as tabular data input.
Assumes the first row to be headings with keys and forms clean Ruby hashmaps for all consecutive rows using cells as values for respective keys.

## Rationale

Originally it was a fork of [batch_factory repo](https://github.com/jumph4x/batch-factory).
Rewritten almost from scratch. The main reason is to provide faster and predictable release cycles.

## Installation

Add this line to your Gemfile

```ruby
gem 'roo-hasherize'
```

or

```ruby
gem install roo-hasherize
```

## Usage examples

```ruby
hash = Roo::Hasherize.call(target, options)
```

options are:
* `keys` - Use it only if your dataset doesn't contain headers
* `sheet` - Number of sheet to hasherize (only makes sense for spreadsheets)
* `extension` - To explicityly specify file format

Spreadsheet type is detected by the file extension (`xls`, `xlsx`, `ods`),
files without extension considered `csv`.
Also, this can be specified explicitly with the `extension` option:


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/xftp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
