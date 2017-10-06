require './lib/journey'

class Oystercard

  MAXIMUM_BALANCE = 100
  MINIMUM_CHARGE = 1


  attr_reader :balance, :journey

  def initialize(balance)
    @balance = balance
    @in_journey = false
    @journey = journey
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
    fail "Insufficient balance" if @balance < MINIMUM_CHARGE
    @journey = Journey.new(station)
    @in_journey = true
  end

  def touch_out(station)
    @in_journey = false
    @journey.finish(station)
    charge(MINIMUM_CHARGE)
  end


end
