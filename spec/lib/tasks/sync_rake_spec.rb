describe 'sync:clear' do
  include_context 'rake'
  before do
    Workflow.create!
    @command = Command.last
  end

  it 'clears the existing workflows' do
    subject.invoke
    expect(Command.where(Z_PK: @command.Z_PK).first).to be_nil
    expect(Trigger.where(ZCOMMAND: @command.Z_PK).first).to be_nil
    expect(Action.where(ZCOMMAND: @command.Z_PK).first).to be_nil
  end
end

describe 'sync:create' do
  include_context 'rake'
  it 'calls create on workflow for defined templates' do
    allow(YAML).to receive(:load).and_return([[
      "Back and Forth", {
        "description"=>"A test command",
        "applications"=>[["org.vim.MacVim", 7]],
        "builder"=>"Navigation::Vim::ToggleFile"
      }
    ]])
    allow(Workflow).to receive(:create!)
    subject.invoke
    expect(Workflow).to have_received(:create!).with({
      application: 'org.vim.MacVim', application_version: 7,
      command_type: 'Keystroke', description: 'A test command',
      verbal_command: 'Back and Forth', action: 'asdf'
    })
  end
end
