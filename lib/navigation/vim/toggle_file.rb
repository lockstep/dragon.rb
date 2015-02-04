module Navigation
  module Vim
    class ToggleFile
      attr_accessor :command_type, :action
      def initialize
        @command_type = 'Text'
        @action = '  \n'
      end
    end
  end
end
