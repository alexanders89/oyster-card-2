class Oystercard

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 100

  attr_reader :balance

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end
end
