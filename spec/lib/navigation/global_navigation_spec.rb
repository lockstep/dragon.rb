describe 'Global Navigation' do
  describe Navigation::Global::UpArrow do
    before { @builder = Navigation::Global::UpArrow.new }
    it_behaves_like 'an applescript'
    it 'triggers the up arrow key a set number of times' do
      expect(@builder.action.align_left).to include <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        on srhandler(vars)
          set spokenArguments to (varSpokenArguments of vars)
          repeat spokenInteger(spokenArguments) times
            tell application "System Events"
              key code 126
            end tell
          end repeat
        end srhandler
      APPLESCRIPT
    end
    it_behaves_like 'it includes spokenInteger'
  end
end
