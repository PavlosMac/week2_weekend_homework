class Guest

  attr_accessor(:name, :wallet)

  def initialize(name, wallet, favourite_song)
    @name = name
    @favourite_song = favourite_song
    @wallet = wallet
  end


  def react
    return "Waayyyheeyyyy!"
  end

end