require_relative './verse'
require_relative './verses'

class Bottles
  def verse(n = 0)
    Verse.new(n).to_s
  end

  def verses(start, stop)
    Verses.new(start, stop).to_s
  end

  def song
    verses(99, 0)
  end
end
