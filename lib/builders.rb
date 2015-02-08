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
  def command_type
    'AppleScript'
  end
end
