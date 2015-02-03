describe Trigger do
  it 'belongs to one command' do
    @trigger = Trigger.first
    expect(@trigger.command).to be_a Command
  end
  it 'initializes with the correct values' do
    @trigger = Trigger.new
    expect(@trigger.attributes).to eq TRIGGER_INIT_VALUES
  end

  TRIGGER_INIT_VALUES = {
    "Z_PK"=>nil,
    "Z_ENT"=> 4,
    "Z_OPT"=>nil,
    "ZISUSER"=> 1,
    "ZCOMMAND"=>nil,
    "ZCURRENTCOMMAND"=>nil,
    "ZDESC"=>nil,
    "ZSPOKENLANGUAGE"=> 'en_US',
    "ZSTRING"=>nil
  }
end
