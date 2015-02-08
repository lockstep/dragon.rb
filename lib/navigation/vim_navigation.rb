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

  end
end
