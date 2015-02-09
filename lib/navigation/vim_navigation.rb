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

  end
end
