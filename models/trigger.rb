class Trigger < ActiveRecord::Base
  self.table_name = "ZTRIGGER"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init, :set_current_command
  validates_presence_of :ZCURRENTCOMMAND

  def set_current_command
    self.ZCURRENTCOMMAND ||= self.ZCOMMAND
  end

  def init
    # self.Z_OPT ||= nil
    # self.ZDESC ||= nil
    # self.ZSTRING ||= nil
    self.Z_ENT ||= 4
    self.ZISUSER ||= 1
    self.ZSPOKENLANGUAGE ||= 'en_US'
  end
end
