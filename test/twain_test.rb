require 'minitest/autorun'

class TwainTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Twain::VERSION
  end

end