class Command < ActiveRecord::Base
  self.table_name = "ZCOMMAND"
  has_one :action, foreign_key: 'ZCOMMAND'
  has_one :trigger, foreign_key: 'ZCOMMAND'
  after_initialize :init
  before_create :set_zopt

  def set_zopt
    # It is unclear what this attribute does, so we'll set it to the most
    # common value currently in the database.
    self.Z_OPT = Command.group('Z_OPT').count.sort_by{|_,v| v}.last[0]
  end

  def init
    # This is version of the application scope/group/bundle, i.e. 40 for Chrome
    # and 7 for Mac Vim, 2 for Terminal. Usually 0, sometimes 1 for Global
    # self.ZAPPVERSION ||= nil
    # self.ZCOMMANDID ||= nil
    # self.ZAPPBUNDLE ||= nil
    # self.ZTYPE ||= nil
    self.ZVENDOR ||= 'Dragon.rb'
    self.Z_ENT ||= 2
    self.ZACTIVE ||= 1
    self.ZDISPLAY ||= 1
    self.ZENGINEID ||= -1
    self.ZISCOMMAND ||= 1
    self.ZISCORRECTION ||=  0
    self.ZISDICTATION ||= 0
    self.ZISSLEEP ||= 0
    self.ZISSPELLING ||= 0
    self.ZLOCATION ||= nil
    self.ZOSLANGUAGE ||= 'en_GB'
    self.ZSPOKENLANGUAGE ||= 'en_US'
    # Mysterious Attributes
    self.ZVERSION ||= 1
    # self.Z_OPT ||= nil
  end
end
