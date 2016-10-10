require('minitest/autorun')
require('minitest/rg')
require_relative'../guests'

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Tobby", 55, "Dancing in the moonlight")
  end

  def test_guest_has_name
    assert_equal("Tobby", @guest1.name)
  end

 


end