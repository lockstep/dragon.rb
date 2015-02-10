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

  end
end
