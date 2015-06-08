RSpec.shared_context 'assets' do
  def filepath(relative)
    File.expand_path(File.join('spec', 'support', 'files', relative))
  end
end
