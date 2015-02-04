class Workflow
  def self.create!
    ActiveRecord::Base.transaction do
      @command = Command.create
      @action = @command.create_action!
      @trigger = @command.create_trigger!
      @command.update!(ZCURRENTTRIGGER: @trigger.id, ZCURRENTACTION: @trigger.id,
                       ZCOMMANDID: @command.id + Command::COMMANDID_START)
    end
  rescue ActiveRecord::RecordInvalid
  end
end
