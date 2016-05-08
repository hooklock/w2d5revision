class Room

  attr_accessor :type, :occupied, :max, :guest

  def initialize (type, occupied, max)
    @type = type
    @occupied = occupied
    @max = max
    @guest = []
  end

  def check_in(guests)
    #Checks the count of guests being passed in, if > than the room max
    #returns message otherwise grabs guests iterates through them
    #Put them in the room one by one
    if guests.size > @max
      return "You're gonna need a bigger room!"
    else
    guests.each { |guest| @guest << guest}
    end
  end

  def check_out(guests)
    #Grabs the guests passed in
    #Iterates through them
    #Empties the array
    guests.each { |guest| @guest.clear }
  end

  def room_max
    return @max
  end

  def room_occupied
    #checks if the guest array contains data
    #sets the room from "Empty" to "Occupied"
    if @guest.count > 0
      return @occupied = "Occupied"
    end
  end



end