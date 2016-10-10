require('pry-byebug')
class Room

  attr_accessor(:name, :guests, :songs)

  def initialize(name, entry_fee)
    @name = name
    @guests = []
    @songs = []
    @entry_fee = entry_fee
  end


  def check_in_guest(guest)
    if guest.wallet > @entry_fee
      @guests << guest
      guest.wallet -= @entry_fee 
    else
      return nil
    end
  end


  # def any_favourite_song(guests)

  # end
    


  def check_in_multiple_guests(guests)
    if (@guests.size < 2 && guests.size < 5) ||  (@guests.size == 2 && guests.size  < 4)
        guests_that_pass = guests.select{|guest| guest.wallet >= @entry_fee} 
        guests_that_pass.map{|guest| guest.wallet -= @entry_fee}
        @guests.push(guests_that_pass)
        # any_favourite_song(guests)
        return @guests.flatten!
    else
        return "full"
    end
  end



  def add_songs_to_room(songs)
    @songs.push(songs).flatten!
  end

 

end