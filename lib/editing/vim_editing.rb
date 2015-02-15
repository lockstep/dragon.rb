module Editing
  module Vim

    class Put < KeystrokeBuilder
      def initialize
        @action = 'p'
      end
    end

    class YankWithinWord < TextMacroBuilder
      def initialize
        @action = 'yiw'
      end
    end

    class YankAroundRubyClass < TextMacroBuilder
      def initialize
        @action = 'yaM'
      end
    end

    class YankAroundRubyBlock < TextMacroBuilder
      def initialize
        @action = 'yar'
      end
    end

    class YankWithinRubyBlock < TextMacroBuilder
      def initialize
        @action = 'yir'
      end
    end

    class YankUp < AppleScriptBuilder
      def initialize
        super
        @action << <<-APPLESCRIPT.align_left
          on srhandler(vars)
            set spokenArguments to (varSpokenArguments of vars)
            keystroke "y" & spokenInteger(spokenArguments) & "k"
          end srhandler
        APPLESCRIPT
        include_spoken_integer
      end
    end

    class YankDown < AppleScriptBuilder
      def initialize
        super
        @action << <<-APPLESCRIPT.align_left
          on srhandler(vars)
            set spokenArguments to (varSpokenArguments of vars)
            keystroke "y" & spokenInteger(spokenArguments) & "j"
          end srhandler
        APPLESCRIPT
        include_spoken_integer
      end
    end

  end
end
