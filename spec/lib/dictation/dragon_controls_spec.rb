describe 'Dragon Dictate Controls' do

  describe Dictation::ShowExpressEditor do
    before { @builder = Dictation::ShowExpressEditor.new }
    it_behaves_like 'an applescript'
    it 'renders the correct script' do
      expect(@builder.action.align_left).to eq <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        tell application _dictateApp
          show express editor
        end tell
        tell application _dictateApp
          set microphone to dictation
        end tell
      APPLESCRIPT
    end
  end

end
