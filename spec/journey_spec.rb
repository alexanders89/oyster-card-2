require './lib/journey'

describe Journey do

  subject(:journey) {described_class.new('High Barnet')}


  it 'is created with an entry station' do
    expect(journey.entry_station).to eq 'High Barnet'
  end

  it 'knows when it is not complete' do
    expect(journey.complete).to be false
  end

  it 'can take an exit station' do
    journey.finish('exit_station')
    expect(journey.exit_station).to eq 'exit_station'
  end

  it 'will end a journey when given an exit station' do
    journey.finish('exit_station')
    expect(journey.complete).to eq true
  end

end
