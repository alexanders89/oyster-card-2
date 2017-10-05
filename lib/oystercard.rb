class Oystercard

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 100
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1


  attr_reader :balance, :in_journey, :entry_station

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
  
  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def charge(amount)
    @balance -= amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    charge(MINIMUM_CHARGE)
    @in_journey = false
  end


end
