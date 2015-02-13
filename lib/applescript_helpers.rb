module AppleScriptHelpers

  def include_spoken_integer
    @action << <<-APPLESCRIPT.align_left
      on spokenInteger(spokenArguments)
        if spokenArguments = "one" then
          set result to "1"
        else if spokenArguments = "to" then
          set result to "2"
        else if spokenArguments = "three" then
          set result to "3"
        else if spokenArguments = "for" then
          set result to "4"
        else if spokenArguments = "five" then
          set result to "5"
        else if spokenArguments = "six" then
          set result to "6"
        else if spokenArguments = "seven" then
          set result to "7"
        else if spokenArguments = "eight" then
          set result to "8"
        else if spokenArguments = "nine" then
          set result to "9"
        else
          set result to spokenArguments
        end if
      end spokenInteger
    APPLESCRIPT
  end

  def include_spaces_removed
    @action << <<-APPLESCRIPT.align_left
      on spacesRemoved(spokenArguments)
        set spaceless to ""
        set characterList to characters of spokenArguments
        repeat with theCharacter in characterList
          if theCharacter as string is equal to " " then
            set spaceless to spaceless & ""
          else
            set spaceless to spaceless & theCharacter
          end if
        end repeat
        return spaceless
      end spacesRemoved
    APPLESCRIPT
  end

  def include_send_characters_with_delay
    @action << <<-APPLESCRIPT.align_left
      on sendCharactersWithDelay(charactersToType)
        repeat with theCharacter in the characters of charactersToType
          tell application "System Events"
            keystroke theCharacter
            delay 0.03
          end tell
        end repeat
      end sendCharactersWithDelay
    APPLESCRIPT
  end

  def set_to_dictation_mode
    @action << <<-APPLESCRIPT.align_left
      tell application _dictateApp
        set microphone to dictation
      end tell
    APPLESCRIPT
  end

end
