describe Workflow do
  describe '#create' do
    it 'saves related command, action and trigger' do
      @workflow = Workflow.create!
      @command = Command.last
      expect(@command.action).to be_a Action
      expect(@command.trigger).to be_a Trigger
    end
    it 'sets current command values' do
      @workflow = Workflow.create!
      @command = Command.last
      expect(@command.action.ZCURRENTCOMMAND).to eq @command.id
      expect(@command.trigger.ZCURRENTCOMMAND).to eq @command.id
    end
    it 'sets the current action and current trigger ids' do
      @workflow = Workflow.create!
      @command = Command.last
      expect(@command.ZCURRENTACTION).to eq @command.action.id
      expect(@command.ZCURRENTTRIGGER).to eq @command.trigger.id
    end
    context 'the action fails to save' do
      before { allow_any_instance_of(Action).to receive(:set_current_command) }
      it 'does not save the command' do
        expect { Workflow.create! }.not_to change{ Command.count }
      end
    end
    context 'the trigger fails to save' do
      before { allow_any_instance_of(Trigger).to receive(:set_current_command) }
      it 'does not save the command' do
        expect { Workflow.create! }.not_to change{ Command.count }
      end
    end
    it 'sets Z_OPT to the most commonly occurring command OPT' do
      @workflow = Workflow.create!
      @command = Command.last
      expect(@command.Z_OPT).to eq 219
    end
    it 'sets the ZCOMMANDID to a strongly negative, likely unique value' do
      @workflow = Workflow.create!
      @command = Command.last
      expect(@command.ZCOMMANDID).to eq(Command::COMMANDID_START + @command.id)
    end
    it 'saves the template-based values correctly' do
      Workflow.create!({
        application: 'com.Mac', application_version: 7,
        description: 'my desc', verbal_command: 'test com',
        command_type: 'key', action: 'asdf'
      })
      @command = Command.last
      @action = @command.action
      @trigger = @command.trigger
      expect(@command.ZAPPBUNDLE).to eq 'com.Mac'
      expect(@command.ZAPPVERSION).to eq 7
      expect(@command.ZTYPE).to eq 'key'
      expect(@action.ZTEXT).to eq 'asdf'
      expect(@trigger.ZDESC).to eq 'my desc'
      expect(@trigger.ZSTRING).to eq 'test com'
    end
  end
end
