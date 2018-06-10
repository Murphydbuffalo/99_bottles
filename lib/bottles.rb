class Bottles
  GENERIC_VERSE_PART_ONE = 'NUM_BOTTLES of beer on the wall, NUM_BOTTLES of beer.'.freeze
  GENERIC_VERSE_PART_TWO = 'Take TAKE_AMOUNT down and pass it around, NUM_BOTTLES of beer on the wall.'.freeze
  ENDING_VERSE           = 'Go to the store and buy some more, 99 bottles of beer on the wall.'.freeze

  def initialize
  end

  def verse(n = 0)
    <<-VERSE
#{verse_start(n)}
#{verse_end(n)}
    VERSE
  end

  def verses(start, stop)
    verse_numbers = (stop..start).to_a.reverse
    verse_numbers.map { |num| verse(num) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def num_bottles(n)
    num     = n.positive? ? n.to_s : 'no more'
    bottles = n == 1 ? 'bottle' : 'bottles'

    "#{num} #{bottles}"
  end

  def take_amount(n)
    n.zero? ? 'it' : 'one'
  end

  def verse_start(n)
    GENERIC_VERSE_PART_ONE.gsub('NUM_BOTTLES', num_bottles(n)).capitalize
  end

  def verse_end(n)
    return ENDING_VERSE if n.zero?

    GENERIC_VERSE_PART_TWO.gsub('NUM_BOTTLES', num_bottles(n - 1)).gsub('TAKE_AMOUNT', take_amount(n - 1))
  end
end
