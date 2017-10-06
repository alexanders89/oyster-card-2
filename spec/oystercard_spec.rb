require './lib/oystercard'

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

    context 'charge' do
      it { is_expected.to respond_to(:charge).with(1).argument}
      it 'can deduct balance' do
        card.charge(5)
        expect(card.balance).to eq 15
      end
    end

    context 'journey' do
      it 'is initialized not in a journey' do
        expect(card.in_journey?).to eq false
      end
      it 'can be in journey' do
      expect(card).to respond_to :in_journey?
    end
      it 'can be touched in to start a journey' do
        card.touch_in(station)
        expect(card.in_journey?).to eq true
      end
      it 'can be touched out to end a journey' do
        card.touch_in(station)
        card.touch_out(station)
        expect(card.in_journey?).to eq false
      end
      it 'cannot be started unless card has minimum balance' do
        card = Oystercard.new(0)
        expect{ card.touch_in(station) }.to raise_error "Insufficient balance"
      end
      it 'is charged on touch out' do
        card.touch_in(station)
        card.touch_out(station)
        expect(card.balance).to eq 19
      end

      context 'journey history' do
        it 'can store the entry station' do
          card.touch_in(station)
          expect(card.live_journey[0]).to eq station
        end
      end
      let(:entry_station) { double :station }
      let(:exit_station) { double :station }
      it 'can store the entry and exit station and a journey' do
        card.touch_in(entry_station)
        card.touch_out(exit_station)
        expect(card.live_journey[1]).to eq exit_station

      end



    end
end
