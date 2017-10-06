class Oystercard

  MAXIMUM_BALANCE = 100
  MINIMUM_CHARGE = 1


  attr_reader :balance, :in_journey

  def initialize(balance)
    @balance = balance
    @in_journey = false
    @record = {}
    @live_journey = []
  end

  def live_journey
    @live_journey
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
    @live_journey << amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_CHARGE
    @in_journey = true
    @entry_station = station
    @live_journey << station

  end

  def touch_out(station)
    @in_journey = false
    @live_journey << station
    charge(MINIMUM_CHARGE)

  end


end
