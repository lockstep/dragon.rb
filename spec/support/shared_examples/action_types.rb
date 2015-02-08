shared_examples 'a keystroke' do |builder_class|
  it 'is a keystroke' do
    expect(@builder.command_type).to eq 'Keystroke'
  end
end

shared_examples 'a text macro' do |builder_class|
  it 'is a text macro' do
    expect(@builder.command_type).to eq 'Text'
  end
end

shared_examples 'an applescript' do |builder_class|
  it 'is an applescript' do
    expect(@builder.command_type).to eq 'AppleScript'
  end
  it 'compiles' do
    File.open("a.txt", 'w+') do |f|
      f.write(@builder.action.nuance_applescript_removed)
    end
    system("osacompile a.txt")
    expect($?.exitstatus).to eq 0
  end
end
