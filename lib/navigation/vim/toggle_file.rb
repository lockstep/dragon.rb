module Navigation
  module Vim
    class ToggleFile
      attr_accessor :command_type, :action
      def initialize
        @command_type = 'Text'
        @action = '  '
      end
    end
  end
end
