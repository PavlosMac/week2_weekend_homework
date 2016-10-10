require('minitest/autorun')
require('minitest/rg')
require_relative'../rooms'
require_relative'../guests'
require_relative'../songs'

class TestRooms < MiniTest::Test

def setup

  guest1 = Guest.new("Henry", 102, "Automatic sun" )
  guest2 = Guest.new("John", 75, "Fly by me")
  guest3 = Guest.new("James", 54, "When the morning comes")
  guest4 = Guest.new("Maria", 53, "Lines of fire")
  guest5 = Guest.new("Hannah", 100, "Shut him up")

  @guest6 = Guest.new("Woolfy", 100, "Hallaig")
  @guest7 = Guest.new("Dennis", 35, "Breathing place")
  
  @guests1 = [guest1, guest2, guest3, guest4, guest5]
  @guests3 = [guest1, guest2, guest3, guest4]
  @guests2 = [guest1, guest5]
  @guests4 = [guest5, guest2, guest3, guest4]

  
  @room1 = Room.new("Rock room", 80)
  @room2 = Room.new("Pop room", 88)
  @room3 = Room.new("Dance room", 30)
  @room4 = Room.new("Country room", 70)


  
  @songs2 = [@song4, @song5]
  @songs = [@song1, @song2, @song3]

  @song1 = Song.new("Imagine", "John Lennon")
  @song2 = Song.new("Welcome to the jungle", "Guns n roses")
  @song3 = Song.new("Hallaig", "Martyn Bennet")
  @song4 = Song.new("Automatic sun", "Solar fields")
  @song5 = Song.new("Breathing place", "Vibrasphere")

end

  def test_room_has_name
    assert_equal(@room1.name, "Rock room")
  end

  def test_room_has_one_guest
    @room1.check_in_guest(@guests1[0])
    assert_equal(@room1.guests.count, 1)
  end

  def test_room_has_more_than_one_guest
    @room3.check_in_multiple_guests(@guests3)
    guest_count = @room3.guests.count
    assert_equal(guest_count, 4)
  end

  def test_add_one_song_to_room
    @room1.add_songs_to_room(@song2)
    song_title = @room1.songs.first.title
    assert_equal(song_title,"Welcome to the jungle" )
  end


  def test_add_songs_to_room
    @room1.add_songs_to_room(@songs)
    song_count = @room1.songs.count
    assert_equal(song_count, 3)
  end

  def test_song_in_room_has_title
    @room1.add_songs_to_room(@song1)
    first_songs_title = @room1.songs.first.title
    assert_equal(first_songs_title, "Imagine")
  end

  def test_song_in_room_has_artist
    @room1.add_songs_to_room(@song1)
    first_songs_artist = @room1.songs.first.artist
    assert_equal(first_songs_artist, "John Lennon")
  end

  def test_room_is_full
    result = @room1.check_in_multiple_guests(@guests1)
    assert_equal(result, "full")
  end

  def test_guest_can_pay_entry_fee
    @room1.check_in_guest(@guest6)
    assert_equal(@guest6.wallet, 20)
  end 

  def test_guest_can_afford_entry_fee
    result = @room2.check_in_guest(@guest7)
    assert_equal(nil, result)
  end

  def test_multiple_guests_can_afford_entry_fee
    @room4.check_in_multiple_guests(@guests4)
    expect = @room4.guests.count
    assert_equal(2, expect)
  end

  def test_that_guests_have_paid
    @room4.check_in_multiple_guests(@guests2)
    modified_guest_wallet = @guests2[0].wallet
    assert_equal(modified_guest_wallet, 32)
  end

  # def test_guest_finds_favourite_song
  #   @room3.add_songs_to_room(@songs2)
  #   @room3.check_in_multiple_guests(@guests2)
  #   result = @room3.any_favourite_song?
  #   assert_equal(result, "Wahheyy!")
  # end


end