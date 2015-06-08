require_relative '../../support/shared/contexts'

RSpec.describe Roo::Hasherize::Worksheet do
  describe '#initialize' do
    include_context 'assets'

    context 'given a file path with extension' do
      subject { -> { described_class.new(filepath('spreadsheet.xls')) } }
      it { is_expected.not_to raise_error }

      context 'without sheet option' do
        subject { described_class.new(filepath('spreadsheet.xls')) }
        its(:name) { should eq 'Sheet1' }
      end

      context 'with sheet option' do
        subject { described_class.new(filepath('spreadsheet.xls'), sheet: 2) }
        its(:name) { should eq 'Sheet3' }
      end
    end

    context 'given a file path without extension' do
      context 'when extension option is not specified' do
        subject { -> { described_class.new(filepath('spreadsheet_xls')) } }
        it { is_expected.to raise_error }
      end

      context 'with extension specified' do
        subject { -> { described_class.new(filepath('spreadsheet_xls'), extension: :xls) } }
        it { is_expected.not_to raise_error }
      end
    end
  end
end
