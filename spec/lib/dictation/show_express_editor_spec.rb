describe Dictation::ShowExpressEditor do
  it 'is an AppleScript' do
    @builder = Dictation::ShowExpressEditor.new
    expect(@builder.command_type).to eq 'AppleScript'
  end
  it 'compiles' do
    @builder = Dictation::ShowExpressEditor.new
    File.open("a.txt", 'w+') do |f|
      f.write(@builder.action.nuance_applescript_removed)
    end
    system("osacompile a.txt")
    expect($?.exitstatus).to eq 0
  end
  it 'renders the correct script' do
    @builder = Dictation::ShowExpressEditor.new
    expect(@builder.action.align_left).to eq <<-APPLESCRIPT.align_left
      set _dictateApp to (name of current application)
      tell application _dictateApp
      -- show express editor
      end tell
    APPLESCRIPT
  end
end
