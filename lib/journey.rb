class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @journey = [Time.now.strftime('%c'), entry_station]
  end

  def complete?
    false
  end

  def finish(exit_station)
    @exit_station = exit_station
    @journey << Time.now.strftime('%c')
    @journey << exit_station
  end
end
