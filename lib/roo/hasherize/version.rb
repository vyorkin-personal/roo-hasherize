module Roo
  module Hasherize
    # Gem version builder module
    module VERSION
      MAJOR = 0
      MINOR = 1
      PATCH = 2
      SUFFIX = '-alpha'

      NUMBER = [MAJOR, MINOR, PATCH].compact.join('.')
      STRING =  "#{NUMBER}#{SUFFIX}"
    end
  end
end
