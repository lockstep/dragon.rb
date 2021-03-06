class Workflow
  def self.create!(params={})
    ActiveRecord::Base.transaction do
      application = params[:application] == 'Global' ? nil : params[:application]
      @command = Command.create(ZAPPBUNDLE: application,
                               ZAPPVERSION: params[:application_version],
                               ZTYPE: params[:command_type])
      @action = @command.create_action!(ZTEXT: params[:action])
      @trigger = @command.create_trigger!(ZDESC: params[:description],
                                         ZSTRING: params[:verbal_command])
      @command.update!(ZCURRENTTRIGGER: @trigger.id, ZCURRENTACTION: @trigger.id,
                       ZCOMMANDID: @command.id + Command::COMMANDID_START)
    end
  rescue ActiveRecord::RecordInvalid
  end
end
