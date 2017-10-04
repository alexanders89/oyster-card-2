require './lib/oystercard'

describe Oystercard do
  context 'balance' do

    it 'can hold a balance' do
      expect(subject).to respond_to :balance
    end

    it 'is created with a balance of 0' do
      expect(subject.balance).to eq 0
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









  end
end
