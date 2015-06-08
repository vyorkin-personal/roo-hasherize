require 'spec_helper'
require_relative '../../support/shared/examples'

RSpec.describe Roo::Hasherize::Parser do
  XLS_EXPECTED = { 'name' => 'Joe Doe', 'address' => '550 Gloiry Blvd.', 'country' => 'United States', 'bid' => 15.99, 'age' => 50 }
  CSV_EXPECTED = { 'name' => 'Joe Doe', 'address' => '550 Gloiry Blvd.', 'country' => 'United States', 'bid' => '15,99', 'age' => '50' }
  TSV_EXPECTED = CSV_EXPECTED

  context 'parsing semicolon separated CSV' do
    it_behaves_like 'valid parser', 'semicolon.csv', CSV_EXPECTED,
      csv_options: { col_sep: ';' }
  end

  context 'parsing TSV' do
    it_behaves_like 'valid parser', 'tab.tsv', TSV_EXPECTED,
      extension: :csv, csv_options: { col_sep: "\t" }
  end

  context 'parsing xls spreadsheet' do
    it_behaves_like 'valid parser', 'spreadsheet.xls', XLS_EXPECTED
  end
end
