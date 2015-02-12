describe 'Vim Navigation' do

  describe Navigation::Vim::ToggleFile do
    before { @builder = Navigation::Vim::ToggleFile.new }
    it_behaves_like 'a text macro'
    it 'is two spaces followed by a return' do
      expect(@builder.action).to eq '  '
    end
  end

  describe Navigation::Vim::RightWindow do
    before { @builder = Navigation::Vim::RightWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control l to navigate a window to the right' do
      expect(@builder.action).to eq 'Control-l'
    end
  end

  describe Navigation::Vim::LeftWindow do
    before { @builder = Navigation::Vim::LeftWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control l to navigate a window to the right' do
      expect(@builder.action).to eq 'Control-h'
    end
  end

  describe Navigation::Vim::UpWindow do
    before { @builder = Navigation::Vim::UpWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control k to navigate a window upwards' do
      expect(@builder.action).to eq 'Control-k'
    end
  end

  describe Navigation::Vim::DownWindow do
    before { @builder = Navigation::Vim::DownWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control j to navigate a window downwards' do
      expect(@builder.action).to eq 'Control-j'
    end
  end

  describe Navigation::Vim::FileTop do
    before { @builder = Navigation::Vim::FileTop.new }
    it_behaves_like 'a text macro'
    it 'hits gg to navigate to the files top' do
      expect(@builder.action).to eq 'gg'
    end
  end

  describe Navigation::Vim::FileBottom do
    before { @builder = Navigation::Vim::FileBottom.new }
    it_behaves_like 'a text macro'
    it 'hits G to navigate to the files bottom' do
      expect(@builder.action).to eq 'G'
    end
  end

  describe Navigation::Vim::LineEnd do
    before { @builder = Navigation::Vim::LineEnd.new }
    it_behaves_like 'a text macro'
    it 'hits $ to navigate to the end of a line' do
      expect(@builder.action).to eq '$'
    end
  end

  describe Navigation::Vim::LineBeginning do
    before { @builder = Navigation::Vim::LineBeginning.new }
    it_behaves_like 'a text macro'
    it 'hits ^ to navigate to the end of a line' do
      expect(@builder.action).to eq '^'
    end
  end

  describe Navigation::Vim::JumpDown do
    before { @builder = Navigation::Vim::JumpDown.new }
    it_behaves_like 'an applescript'
    it 'prepends j with the spoken integer' do
      expect(@builder.action.align_left).to eq <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        on srhandler(vars)
          set spokenArguments to (varSpokenArguments of vars)
          keystroke spokenInteger(spokenArguments) & "j"
        end srhandler
        on spokenInteger(spokenArguments)
          if spokenArguments = "one" then
            set result to "1"
          else if spokenArguments = "to" then
            set result to "2"
          else if spokenArguments = "three" then
            set result to "3"
          else if spokenArguments = "for" then
            set result to "4"
          else if spokenArguments = "five" then
            set result to "5"
          else if spokenArguments = "six" then
            set result to "6"
          else if spokenArguments = "seven" then
            set result to "7"
          else if spokenArguments = "eight" then
            set result to "8"
          else if spokenArguments = "nine" then
            set result to "9"
          else
            set result to spokenArguments
          end if
        end spokenInteger
      APPLESCRIPT
    end
  end

  describe Navigation::Vim::JumpUp do
    before { @builder = Navigation::Vim::JumpUp.new }
    it_behaves_like 'an applescript'
    it 'prepends j with the spoken integer' do
      expect(@builder.action.align_left).to eq <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        on srhandler(vars)
          set spokenArguments to (varSpokenArguments of vars)
          keystroke spokenInteger(spokenArguments) & "k"
        end srhandler
        on spokenInteger(spokenArguments)
          if spokenArguments = "one" then
            set result to "1"
          else if spokenArguments = "to" then
            set result to "2"
          else if spokenArguments = "three" then
            set result to "3"
          else if spokenArguments = "for" then
            set result to "4"
          else if spokenArguments = "five" then
            set result to "5"
          else if spokenArguments = "six" then
            set result to "6"
          else if spokenArguments = "seven" then
            set result to "7"
          else if spokenArguments = "eight" then
            set result to "8"
          else if spokenArguments = "nine" then
            set result to "9"
          else
            set result to spokenArguments
          end if
        end spokenInteger
      APPLESCRIPT
    end
  end

  describe Navigation::Vim::CtrlP do
    before { @builder = Navigation::Vim::CtrlP.new }
    it_behaves_like 'an applescript'
    it 'activates ctrl p and searches the phrase with no spaces' do
      expect(@builder.action.align_left).to eq <<-APPLESCRIPT.align_left
        on srhandler(vars)
          set _dictateApp to (name of current application)
          set spokenArguments to (varSpokenArguments of vars)
          try
            tell application _dictateApp
              using terms from application "System Events"
                «event DctaSnKS» "p" given «class faal»:{control down}
              end using terms from
            end tell
            set noSpaces to spacesRemoved(spokenArguments)
            repeat with theCharacter in the characters of noSpaces
              tell application "System Events"
                keystroke theCharacter
                delay 0.03
              end tell
            end repeat
          end try
        end srhandler
        on spacesRemoved(spokenArguments)
          set spaceless to ""
          set characterList to characters of spokenArguments
          repeat with theCharacter in characterList
            if theCharacter as string is equal to " " then
              set spaceless to spaceless & ""
            else
              set spaceless to spaceless & theCharacter
            end if
          end repeat
          return spaceless
        end spacesRemoved
      APPLESCRIPT
    end
  end
end
