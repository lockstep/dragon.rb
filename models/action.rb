class Action < ActiveRecord::Base
  self.table_name = "ZACTION"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init, :set_current_command
  validates_presence_of :ZCURRENTCOMMAND

  def set_current_command
    self.ZCURRENTCOMMAND ||= self.ZCOMMAND
  end

  def init
    # Template-driven Attributes
    # This is the action to run (the keystrokes in a macro, the uncompiled
    # AppleScript, etc)
    # self.ZTEXT ||= nil

    # Defaults
    self.ZDATA ||= nil
    self.Z_ENT ||= 1
    self.ZISUSER ||= 1
    self.ZOSLANGUAGE ||= 'en_US'

    # Mysterious Attributes
    self.Z_OPT ||= 30 # This is completely arbitrary, unsure of purpose
  end
end
