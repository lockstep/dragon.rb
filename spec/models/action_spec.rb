describe Action do
  it 'has one command' do
    @action = Action.first
    expect(@action.command).to be_a Command
  end
  it 'initializes with the correct values' do
    @action = Action.new
    expect(@action.attributes).to eq ACTION_INIT_VALUES
  end
  it 'valiates presence of current_command' do
    @action = Action.new
    expect(@action).not_to be_valid
  end
  it 'has a Z_PK id' do
    @action = Action.create(ZCOMMAND: 0)
    expect(@action.Z_PK).to be_a Integer
  end
  it 'does not overrite current command on find' do
    @action = Action.first
    original_current_command = @action.ZCURRENTCOMMAND
    @action.update(ZCOMMAND: 0)
    @action = Action.find(@action.id)
    expect(@action.ZCURRENTCOMMAND).to eq original_current_command
  end

  ACTION_INIT_VALUES = {
    "Z_PK"=>nil,
    "Z_ENT"=> 1,
    "Z_OPT"=>30,
    "ZISUSER"=> 1,
    "ZCOMMAND"=>nil,
    "ZCURRENTCOMMAND"=>nil,
    "ZOSLANGUAGE"=> 'en_US',
    "ZTEXT"=>nil,
    "ZDATA"=>nil
  }
end
