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
        @action = <<-APPLESCRIPT.align_left
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

  end
end
