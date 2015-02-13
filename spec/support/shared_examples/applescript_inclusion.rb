shared_examples 'it includes spokenInteger' do
  it 'includes the method definition' do
    expect(@builder.action).to match 'on spokenInteger'
  end
end
shared_examples 'it includes spacesRemoved' do
  it 'includes the method definition' do
    expect(@builder.action).to match 'on spacesRemoved'
  end
end
shared_examples 'it includes sendCharactersWithDelay' do
  it 'includes the method definition' do
    expect(@builder.action).to match 'on sendCharactersWithDelay'
  end
end
