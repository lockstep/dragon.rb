describe Command do
  it 'has one action' do
    @command = Command.first
    expect(@command.action).to be_a Action
  end
  it 'has a trigger' do
    @command = Command.first
    expect(@command.trigger).to be_a Trigger
  end
  it 'initializes with the correct values' do
    @command = Command.new
    expect(@command.attributes).to eq COMMAND_INIT_VALUES
  end
  it 'has a Z_PK id' do
    @command = Command.create
    expect(@command.Z_PK).to be_a Integer
  end

  COMMAND_INIT_VALUES = {
    "Z_PK"=>nil,
    "Z_ENT"=> 2,
    "Z_OPT"=>nil,
    "ZACTIVE"=> 1,
    "ZAPPVERSION"=>nil,
    "ZCOMMANDID"=>nil,
    "ZDISPLAY"=> 1,
    "ZENGINEID"=> -1,
    "ZISCOMMAND"=> 1,
    "ZISCORRECTION"=>  0,
    "ZISDICTATION"=> 0,
    "ZISSLEEP"=> 0,
    "ZISSPELLING"=> 0,
    "ZVERSION"=>nil,
    "ZCURRENTACTION"=>nil,
    "ZCURRENTTRIGGER"=>nil,
    "ZLOCATION"=>nil,
    "ZAPPBUNDLE"=>nil,
    "ZOSLANGUAGE"=> 'en_GB',
    "ZSPOKENLANGUAGE"=> 'en_US',
    "ZTYPE"=>nil,
    "ZVENDOR"=> 'Dragon.rb'
  }
end
