describe Action do
  it 'has one command' do
    @action = Action.first
    expect(@action.command).to be_a Command
  end
  it 'initializes with the correct values' do
    @action = Action.new
    expect(@action.attributes).to eq ACTION_INIT_VALUES
  end

  ACTION_INIT_VALUES = {
    "Z_PK"=>nil,
    "Z_ENT"=> 1,
    "Z_OPT"=>nil,
    "ZISUSER"=> 1,
    "ZCOMMAND"=>nil,
    "ZCURRENTCOMMAND"=>nil,
    "ZOSLANGUAGE"=> 'en_US',
    "ZTEXT"=>nil,
    "ZDATA"=>nil
  }
end
