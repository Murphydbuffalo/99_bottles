require_relative './verse'

class Verses
  def initialize(start, stop)
    @start = start
    @stop  = stop
  end

  def to_s
    verse_numbers.map { |num| verse(num) }.join("\n")
  end

  private

  attr_reader :start, :stop

  def verse_numbers
    (stop..start).to_a.reverse
  end

  def verse(n)
    Verse.new(n).to_s
  end
end
