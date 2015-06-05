require 'roo/hasherize/version'

module Roo
  # Main gem module.
  # Also acts as a facade / public API
  module Hasherize
    def self.call(target, options = {})
      Roo::Hasherize::Parser.call(target, options)
    end
  end
end
