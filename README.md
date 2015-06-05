# roo-hasherize

Built on top of the roo gem for easy abstraction of Excel and OpenOffice spreadsheets as tabular data input.

## Rationale

Originally it was a fork of [batch_factory repo](https://github.com/jumph4x/batch-factory).
Rewritten almost from scratch. The main reason is to provide faster and predictable release cycles.

## Installation

Add this line to your Gemfile

```ruby
gem `roo-hasherize'
```

or

```ruby
gem install roo-hasherize
```

## Usage examples

```ruby
hash = Roo::Hasherize.file(filepath, options)
hash = Roo::Hasherize.stream(io, options)
hash = Roo::Hasherize.url(uri, options)
```
