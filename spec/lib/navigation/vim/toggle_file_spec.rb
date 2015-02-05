describe Navigation::Vim::ToggleFile do
  it 'is a kay macro' do
    @builder = Navigation::Vim::ToggleFile.new
    expect(@builder.command_type).to eq 'Text'
  end
  it 'is two spaces followed by a return' do
    @builder = Navigation::Vim::ToggleFile.new
    expect(@builder.action).to eq '  '
  end
end
