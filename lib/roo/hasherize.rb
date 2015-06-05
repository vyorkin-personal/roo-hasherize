require 'roo/hasherize/version'
require 'roo/hasherize/worksheet'
require 'roo/hasherize/parser'

module Roo
  # Main gem module.
  # Also acts as a facade / public API
  module Hasherize
    def self.call(target, options = {})
      Parser.call(target, options)
    end
  end
end
