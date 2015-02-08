module Navigation
  module Vim
    class RightWindow < ActionBuilder
      def initialize
        @command_type = 'Keystroke'
        @action = 'Control-l'
      end
    end
  end
end
