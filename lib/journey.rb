class Journey

  attr_reader :entry_station, :exit_station, :complete

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @complete = false
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
  end
end
