require './lib/oystercard'

class Journey

  attr_accessor :entry_station, :exit_station, :complete, :charge

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @complete = false
    @charge = charge
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
    deduct_charge(card)
  end

  def calculate_charge(card)
    @charge = 1
  end

  def deduct_charge(card)
    card.balance - calculate_charge
  end
end
