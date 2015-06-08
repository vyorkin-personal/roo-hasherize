require 'uri'
require 'active_support/core_ext/object/blank'
require 'active_support/hash_with_indifferent_access'
require 'roo-xls'

module Roo
  module Hasherize
    # Parses & "hasherizes" given spreadsheet
    # @api private
    class Parser
      def self.call(target, options = {})
        new.call(target, options)
      end

      def call(target, options = {})
        @worksheet = Worksheet.new(target, options)
        @user_keys = options[:keys]
        @keys = parse_keys

        rows.map { |row| HashWithIndifferentAccess[parse_row(row)] }
      end

      private

      def parse_keys
        source_keys = @user_keys || @worksheet.row(@worksheet.first_row)
        source_keys.map { |key| key.blank? ? nil : key.strip }
      end

      def parse_row(row)
        @keys.zip(row).reject { |key, value| key.blank? || value.blank? }
      end

      def rows
        row_bounds.map { |index| @worksheet.row(index) }
      end

      def row_bounds
        (first_row..@worksheet.last_row)
      end

      def column_bounds
        (@worksheet.first_column - 1)..(@worksheet.last_column - 1)
      end

      def first_row
        @worksheet.first_row + first_row_offset
      end

      def first_row_offset
        @user_keys ? 0 : 1
      end
    end
  end
end
