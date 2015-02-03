class Trigger < ActiveRecord::Base
  self.table_name = "ZTRIGGER"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init

  def init
    # self.Z_PK ||= nil
    # self.Z_OPT ||= nil
    # self.ZCOMMAND ||= nil
    # self.ZCURRENTCOMMAND ||= nil
    # self.ZDESC ||= nil
    # self.ZSTRING ||= nil
    self.Z_ENT ||= 4
    self.ZISUSER ||= 1
    self.ZSPOKENLANGUAGE ||= 'en_US'
  end
end
