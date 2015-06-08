require_relative '../support/shared/contexts'

RSpec.describe Roo::Hasherize do
  context 'given a valid spreadsheet file path' do
    include_context 'assets'

    subject { described_class.call(filepath('spreadsheet.xls')) }

    it 'should open a file and return an array of hashes containing row data' do
      expect(subject.size).to eq 1
      expect(subject[0][:age]).to eq 50
    end
  end

  it 'has a version number' do
    expect(Roo::Hasherize::VERSION::STRING).not_to be nil
  end
end
