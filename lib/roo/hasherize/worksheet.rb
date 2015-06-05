require 'roo'

module Roo
  module Hasherize
    # Acts as a ghost proxy for Roo::Spreadsheet
    # @api private
    class Worksheet
      attr_reader :name, :sheet

      def initialize(target, options = {})
        @sheet = options.delete(:sheet) || 0
        @spreadsheet = Roo::Spreadsheet.open(target, options)
        @name = @spreadsheet.sheets[@sheet]
      end

      def respond_to_missing?(method, _include_private)
        @spreadsheet.respond_to? method.to_sym
      end

      def method_missing(method, *args, &block)
        @spreadsheet.send(method, *(args + [@name]), &block)
      end
    end
  end
end
