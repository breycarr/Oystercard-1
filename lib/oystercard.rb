class Oystercard

  attr_reader :balance, :journeys

  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1
  FARE = 3

  def initialize
    @balance = 0
    @journeys = {}

  end

  def top_up(amount)
  	raise "Exceeded maximum balance!" if limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(start_station)
    raise "Insufficient funds!" if insufficient_funds
    @journeys[:start_station] = start_station
  end

  def touch_out(end_station)
    deduct(FARE)
    @journeys[:end_station] = end_station
  end

  def in_journey?
    !!journeys[:start_station] && !journeys[:end_station] ? true : false
  end

  def journey_history
    return "No journeys on this card" if journeys[:start_station] == nil && journeys[:end_station] == nil
    "Journey 1: #{@journeys[:start_station]} to #{@journeys[:end_station]}"
  end

private

  def limit_exceeded?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def insufficient_funds
    @balance < MINIMUM_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
