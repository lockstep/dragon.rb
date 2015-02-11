module Dictation

  class ShowExpressEditor < AppleScriptBuilder
    def initialize
      super
      @action << <<-APPLESCRIPT.align_left
        tell application _dictateApp
          show express editor
        end tell
      APPLESCRIPT
      set_to_dictation_mode
    end
  end

end
