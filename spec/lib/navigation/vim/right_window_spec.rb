describe Navigation::Vim::RightWindow do
  before { @builder = Navigation::Vim::RightWindow.new }
  it_behaves_like 'a keystroke'
  it 'hits control l to navigate a window to the right' do
    expect(@builder.action).to eq 'Control-l'
  end
end
