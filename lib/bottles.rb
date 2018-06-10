require_relative './verse'

class Bottles
  def verse(n = 0)
    Verse.new(n).to_s
  end

  def verses(start, stop)
    verse_numbers = (stop..start).to_a.reverse
    verse_numbers.map { |num| verse(num) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
