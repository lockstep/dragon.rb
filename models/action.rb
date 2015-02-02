class Action < ActiveRecord::Base
  self.table_name = "ZACTION"
  belongs_to :command, foreign_key: 'ZCOMMAND'
  after_initialize :init

  def init
    # self.Z_PK ||= nil
    # self.Z_OPT ||= nil
    # self.ZCOMMAND ||= nil
    # self.ZCURRENTCOMMAND ||= nil
    # self.ZTEXT ||= nil
    # self.ZDATA ||= nil
    self.Z_ENT ||= 1
    self.ZISUSER ||= 1
    self.ZOSLANGUAGE ||= 'en_US'
  end
end
