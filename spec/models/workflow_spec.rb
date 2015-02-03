describe Workflow do
  before { Command.delete_all }
  describe '#create' do
    it 'saves related command, action and trigger' do
      @workflow = Workflow.create!
      @command = Command.first
      expect(@command.action).to be_a Action
      expect(@command.trigger).to be_a Trigger
    end
    it 'sets current command values' do
      @workflow = Workflow.create!
      @command = Command.first
      expect(@command.action.ZCURRENTCOMMAND).to eq @command.id
      expect(@command.trigger.ZCURRENTCOMMAND).to eq @command.id
    end
    it 'sets the current action and current trigger ids' do
      @workflow = Workflow.create!
      @command = Command.first
      expect(@command.ZCURRENTACTION).to eq @command.action.id
      expect(@command.ZCURRENTTRIGGER).to eq @command.trigger.id
    end
    context 'the action fails to save' do
      before { allow_any_instance_of(Action).to receive(:set_current_command) }
      it 'does not save the command' do
        @workflow = Workflow.create!
        @command = Command.first
        expect(@command).to be_nil
      end
    end
    context 'the trigger fails to save' do
      before { allow_any_instance_of(Trigger).to receive(:set_current_command) }
      it 'does not save the command' do
        @workflow = Workflow.create!
        @command = Command.first
        expect(@command).to be_nil
      end
    end
  end
end
