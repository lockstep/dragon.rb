module Navigation
  module Vim

    class ToggleFile < TextMacroBuilder
      def initialize
        @action = '  '
      end
    end

    class RightWindow < KeystrokeBuilder
      def initialize
        @action = 'Control-l'
      end
    end

    class LeftWindow < KeystrokeBuilder
      def initialize
        @action = 'Control-h'
      end
    end

    class UpWindow < KeystrokeBuilder
      def initialize
        @action = 'Control-k'
      end
    end

    class DownWindow < KeystrokeBuilder
      def initialize
        @action = 'Control-j'
      end
    end

    class FileTop < TextMacroBuilder
      def initialize
        @action = 'gg'
      end
    end

    class FileBottom < TextMacroBuilder
      def initialize
        @action = 'G'
      end
    end

    class LineEnd < TextMacroBuilder
      def initialize
        @action = '$'
      end
    end

    class LineBeginning < TextMacroBuilder
      def initialize
        @action = '^'
      end
    end

    class JumpDown < AppleScriptBuilder
      def initialize
        super
        @action << <<-APPLESCRIPT.align_left
          on srhandler(vars)
            set spokenArguments to (varSpokenArguments of vars)
            keystroke spokenInteger(spokenArguments) & "j"
          end srhandler
        APPLESCRIPT
        include_spoken_integer
      end
    end

    class JumpUp < AppleScriptBuilder
      def initialize
        super
        @action << <<-APPLESCRIPT.align_left
          on srhandler(vars)
            set spokenArguments to (varSpokenArguments of vars)
            keystroke spokenInteger(spokenArguments) & "k"
          end srhandler
        APPLESCRIPT
        include_spoken_integer
      end
    end

    class CtrlP < AppleScriptBuilder
      def initialize
        super
        @action = <<-APPLESCRIPT.align_left
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
              sendCharactersWithDelay(noSpaces)
            end try
          end srhandler
        APPLESCRIPT
        include_spaces_removed
        include_send_characters_with_delay
      end
    end

  end
end
