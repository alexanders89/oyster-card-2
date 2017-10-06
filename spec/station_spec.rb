require './lib/station'

describe Station do

  subject(:station) {described_class.new('High Barnet', 1)}

  it 'is initiated with a name' do
    expect(station.name).to eq 'High Barnet'
  end

  it 'is initiated with a zone' do
    expect(station.zone).to eq 1
  end

end
