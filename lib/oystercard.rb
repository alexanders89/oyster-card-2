class Oystercard

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 100
  MINIMUM_BALANCE = 1

  attr_reader :balance, :in_journey

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def balance
    @balance
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def charge(amount)
    @balance -= amount
  end

  def touch_in
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
