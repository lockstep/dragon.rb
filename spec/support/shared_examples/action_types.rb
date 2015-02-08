shared_examples 'a keystroke' do |builder_class|
  it 'is a keystroke' do
    expect(@builder.command_type).to eq 'Keystroke'
  end
end
