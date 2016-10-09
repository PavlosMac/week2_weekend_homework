require('minitest/autorun')
require('minitest/rg')
require_relative'../songs'

class TestSongs < MiniTest::Test


  def setup
    @song = Song.new("Davis Don", "Lovely mountain")
  end

  def test_check_song_name
    assert_equal("Lovely mountain", @song.title)
  end

  def test_check_song_artist
    assert_equal("Davis Don", @song.artist)
  end

end

