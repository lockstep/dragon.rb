describe Navigation::Vim::LeftWindow do
  before { @builder = Navigation::Vim::LeftWindow.new }
  it_behaves_like 'a keystroke'
  it 'hits control l to navigate a window to the right' do
    expect(@builder.action).to eq 'Control-h'
  end
end
