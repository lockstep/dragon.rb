class Action < ActiveRecord::Base
  self.table_name = "ZACTION"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init, :set_current_command
  validates_presence_of :ZCURRENTCOMMAND

  def set_current_command
    self.ZCURRENTCOMMAND ||= self.ZCOMMAND
  end

  def init
    # self.Z_OPT ||= nil
    # self.ZTEXT ||= nil
    self.ZDATA ||= nil
    self.Z_ENT ||= 1
    self.ZISUSER ||= 1
    self.ZOSLANGUAGE ||= 'en_US'
  end
end
