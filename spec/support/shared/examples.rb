RSpec.shared_examples 'valid parser' do |filename, expected, options = {}|
  let(:filepath) { File.expand_path(File.join('spec', 'support', 'files', filename)) }
  let(:rows) { subject.call(filepath, options) }

  it 'should parse the data rows' do
    expect(rows[0]).to eq expected
    expect(rows.size).to eq 1
  end
end
