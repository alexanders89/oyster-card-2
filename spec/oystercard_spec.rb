require './lib/oystercard'
require './lib/journey'


describe Oystercard do
  let(:station){ double :station}
  subject(:card) {described_class.new(20)}

  context 'balance' do
    it 'can hold a balance' do
      expect(card).to respond_to :balance
    end
    it 'is created with a balance of 0' do
      card = Oystercard.new(0)
      expect(card.balance).to eq 0
    end
  end

    context 'top up' do
      it { is_expected.to respond_to(:top_up).with(1).argument}
      it 'can top up the balance' do
        expect{ card.top_up 10 }.to change{ card.balance }.by 10
      end
      it 'will have a maximum balance' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        card = Oystercard.new(0)
        card.top_up(maximum_balance)
        expect{ card.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
      end
    end

    context 'journey' do
      it 'will start a new journey on touching in' do
        card.touch_in('High Barnet')
        expect(card.journey.entry_station).to eq 'High Barnet'
      end

      it 'adds the exit station on touching out' do
        card.touch_in('High Barnet')
        card.touch_out('Mile End')
        expect(card.journey.exit_station).to eq 'Mile End'
      end

      it 'will end a journey on touching out' do
        card.touch_in('High Barnet')
        card.touch_out('Mile End')
        expect(card.journey.complete).to eq true
      end

    end
end
