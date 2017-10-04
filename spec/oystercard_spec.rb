require './lib/oystercard'

describe Oystercard do
  let(:station){ double :station}


  context 'balance' do
    it 'can hold a balance' do
      expect(subject).to respond_to :balance
    end
    it 'is created with a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

    context 'top up' do
      it { is_expected.to respond_to(:top_up).with(1).argument}
      it 'can top up the balance' do
        expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
      end
      it 'will have a maximum balance' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        subject.top_up(maximum_balance)
        expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
      end
    end

    context 'charge' do
      it { is_expected.to respond_to(:charge).with(1).argument}
      it 'can deduct balance' do
        subject.top_up(10)
        subject.charge(5)
        expect(subject.balance).to eq 5
      end
    end

    context 'journey' do
      it 'is initialized not in a journey' do
        expect(subject.in_journey?).to eq false
      end
      it 'can be in journey' do
      expect(subject).to respond_to :in_journey?
    end
      it 'can be touched in to start a journey' do
        card = Oystercard.new
        card.top_up(10)
        card.touch_in(station)
        expect(card.in_journey?).to eq true
      end
      it 'can be touched out to end a journey' do
        card = Oystercard.new
        card.top_up(10)
        card.touch_in(station)
        subject.touch_out
        expect(subject.in_journey?).to eq false
      end
      it 'cannot be started unless card has minimum balance' do
        expect{ subject.touch_in(station) }.to raise_error "Insufficient balance"
      end
      it 'is charged on touch out' do
        card = Oystercard.new
        card.top_up(10)
        card.touch_in(station)
        card.touch_out
        expect(card.balance).to eq 9
      end

      context 'journey history' do
        it 'can store the entry station' do
          subject.top_up(10)
          subject.touch_in(station)
          expect(subject.entry_station).to eq station
        end
      end



    end
end
