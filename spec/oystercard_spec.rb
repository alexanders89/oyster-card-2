require './lib/oystercard'

describe Oystercard do
  context 'balance' do

    it 'can hold a balance' do
      card = Oystercard.new
      expect(card).to respond_to :balance
    end

    it 'is created with a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

end
