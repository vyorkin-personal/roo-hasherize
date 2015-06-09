require_relative '../../support/shared/examples'

RSpec.describe Roo::Hasherize::Parser do
  XLS_EXPECTED = { 'name' => 'Joe Doe', 'address' => '550 Gloiry Blvd.', 'country' => 'United States', 'bid' => 15.99, 'age' => 50 }
  XLSX_EXPECTED = XLS_EXPECTED

  CSV_EXPECTED = { 'name' => 'Joe Doe', 'address' => '550 Gloiry Blvd.', 'country' => 'United States', 'bid' => '15.99', 'age' => '50' }
  CSV_USING_NUMERIC_CONVERTER = { 'name' => 'Joe Doe', 'address' => '550 Gloiry Blvd.', 'country' => 'United States', 'bid' => 15.99, 'age' => 50 }
  TSV_EXPECTED = CSV_EXPECTED

  context 'parsing normal (comma-separated) CSV' do
    context 'with extension' do
      it_behaves_like 'valid parser', 'normal.csv', CSV_EXPECTED
    end

    context 'using converters' do
      it_behaves_like 'valid parser', 'normal.csv', CSV_USING_NUMERIC_CONVERTER,
        csv_options: { converters: :numeric }
    end

    context 'without extension' do
      it_behaves_like 'valid parser', 'normal_csv', CSV_EXPECTED,
        extension: :csv
    end

    context 'overriding extension' do
      it_behaves_like 'valid parser', 'normal_csv', CSV_EXPECTED,
        extension: :csv
    end
  end

  context 'parsing semicolon-separated CSV' do
    it_behaves_like 'valid parser', 'semicolon.csv', CSV_EXPECTED,
      csv_options: { col_sep: ';' }
  end

  context 'parsing TSV' do
    it_behaves_like 'valid parser', 'tab.tsv', TSV_EXPECTED,
      extension: :csv, csv_options: { col_sep: "\t" }
  end

  context 'parsing xls spreadsheet' do
    context 'with no spreadsheet number specified' do
      context 'with extension' do
        it_behaves_like 'valid parser', 'spreadsheet.xls', XLS_EXPECTED
      end

      context 'without extension' do
        it_behaves_like 'valid parser', 'spreadsheet_xls', XLS_EXPECTED,
          extension: :xls
      end
    end

    context 'when parsing second sheet' do
      it_behaves_like 'valid parser', 'spreadsheet.xls', XLS_EXPECTED,
        sheet: 1
    end
  end

  context 'parsing xlsx spreadsheet' do
    context 'with extension' do
      it_behaves_like 'valid parser', 'spreadsheet.xlsx', XLSX_EXPECTED
    end

    context 'without extension' do
      it_behaves_like 'valid parser', 'spreadsheet.xlsx', XLSX_EXPECTED,
        extension: :xlsx
    end
  end
end
