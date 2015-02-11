class ActionBuilder
  attr_accessor :action
end

class TextMacroBuilder < ActionBuilder
  def command_type
    'Text'
  end
end

class KeystrokeBuilder < ActionBuilder
  def command_type
    'Keystroke'
  end
end

class AppleScriptBuilder < ActionBuilder
  include AppleScriptHelpers

  def initialize
    @action = "set _dictateApp to (name of current application)\n"
  end

  def command_type
    'AppleScript'
  end
end
