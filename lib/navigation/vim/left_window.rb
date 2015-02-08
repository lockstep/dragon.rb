module Navigation
  module Vim
    class LeftWindow < ActionBuilder
      def initialize
        @command_type = 'Keystroke'
        @action = 'Control-h'
      end
    end
  end
end
