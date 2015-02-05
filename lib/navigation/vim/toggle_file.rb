module Navigation
  module Vim
    class ToggleFile < ActionBuilder
      def initialize
        @command_type = 'Text'
        @action = '  '
      end
    end
  end
end
