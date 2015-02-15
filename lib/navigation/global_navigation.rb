module Navigation
  module Global

    class UpArrow < AppleScriptBuilder
      def initialize
        super
        @action << <<-APPLESCRIPT.align_left
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
        include_spoken_integer
      end
    end

  end
end
