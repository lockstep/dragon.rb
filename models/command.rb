class Command < ActiveRecord::Base
  self.table_name = "ZCOMMAND"
  has_one :action, foreign_key: 'ZCOMMAND'
  has_one :trigger, foreign_key: 'ZCOMMAND'
  after_initialize :init

  def init
    # self.Z_OPT ||= nil
    # self.ZAPPVERSION ||= nil
    # self.ZCOMMANDID ||= nil
    # self.ZVERSION ||= nil
    # self.ZLOCATION ||= nil
    # self.ZAPPBUNDLE ||= nil
    # self.ZTYPE ||= nil
    # self.ZVENDOR ||= nil
    self.Z_ENT ||= 2
    self.ZACTIVE ||= 1
    self.ZDISPLAY ||= 1
    self.ZENGINEID ||= -1
    self.ZISCOMMAND ||= 1
    self.ZISCORRECTION ||=  0
    self.ZISDICTATION ||= 0
    self.ZISSLEEP ||= 0
    self.ZISSPELLING ||= 0
    self.ZOSLANGUAGE ||= 'en_GB'
    self.ZSPOKENLANGUAGE ||= 'en_US'
  end
end
