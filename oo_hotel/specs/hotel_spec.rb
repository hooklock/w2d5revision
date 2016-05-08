require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../hotel')
require_relative('../room')
require_relative('../guest')

class TestHotel < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Mr Smith")
    @guest2 = Guest.new("Mr Jones")
    @guest3 = Guest.new("Mrs Jones")
    @room1guest = [@guest1]
    @room2guests = [@guest2, @guest3]
    @room1 = Room.new("Single", "Empty", 1)
    @room2 = Room.new("Double", "Empty", 2)
    @room3 = Room.new("Family", "Empty", 4)
    @room4 = Room.new("Single", "Empty", 1)
    @room5 = Room.new("Double", "Empty", 2)
    @room6 = Room.new("Double", "Empty", 2)

    @rooms = [@room1, @room2, @room3, @room4, @room5, @room6]

    @hotel = Hotel.new(@rooms)
  end

  def test_number_of_rooms
    assert_equal(6, @hotel.num_rooms)
  end

  def test_max_number_of_guests
    assert_equal(12, @hotel.max_guests)
  end

  def test_empty_room_count
    assert_equal(6, @hotel.empty_room)
  end

  def test_room1_check_in_guest
    @room2.check_in(@room2guests)
    assert_equal(2, @room2.guest.count)
  end

  def test_room2_check_in_guest
    @room1.check_in(@room1guest)
    assert_equal(1, @room1.guest.count)
  end

  def test_check_out_guest
    @room1.check_out(@room1guest)
    assert_equal(0, @room1.guest.count)
  end

  def test_room_max
    assert_equal(1, @room1.room_max)
  end
end