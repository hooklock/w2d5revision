class Hotel

  def initialize(rooms)
    @rooms = rooms
  end

  def num_rooms
    return @rooms.count
  end

  def max_guests
    sum = 0
    @rooms.each { |room| sum += room.max }
    return sum
  end

  def empty_room
    empty = []
    @rooms.each { |room| empty << room.occupied == "Empty" }
    return empty.count
  end
  

end