class Trigger < ActiveRecord::Base
  self.table_name = "ZTRIGGER"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init, :set_current_command
  validates_presence_of :ZCURRENTCOMMAND

  def set_current_command
    self.ZCURRENTCOMMAND ||= self.ZCOMMAND
  end

  def init
    # Template-driven Attributes
    # This is the description of the action
    # self.ZDESC ||= nil
    # This is the spoken action that triggers the action
    # self.ZSTRING ||= nil

    # Defaults
    self.Z_ENT ||= 4
    self.ZISUSER ||= 1
    self.ZSPOKENLANGUAGE ||= 'en_US'

    # Mysterious Attributes
    self.Z_OPT ||= 30 # This is completely arbitrary, unsure of purpose
  end
end
