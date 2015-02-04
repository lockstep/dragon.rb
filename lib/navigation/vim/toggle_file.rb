module Navigation
  module Vim
    class ToggleFile
      attr_accessor :command_type, :action
      def initialize
        @command_type = 'Keystroke'
        @action = 'asdf'
      end
    end
  end
end
