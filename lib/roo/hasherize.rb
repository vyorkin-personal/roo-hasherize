require 'roo/hasherize/version'

module Roo
  # Main gem module.
  # Also acts as a facade / public API
  module Hasherize
    def self.call(target, options = {})
      Parser.call(target, options)
    end
  end
end
