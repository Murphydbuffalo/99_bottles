class Verse
  GENERIC_VERSE_PART_ONE = 'NUM_BOTTLES of beer on the wall, NUM_BOTTLES of beer.'.freeze
  GENERIC_VERSE_PART_TWO = 'Take TAKE_AMOUNT down and pass it around, NUM_BOTTLES of beer on the wall.'.freeze
  ENDING_VERSE           = 'Go to the store and buy some more, 99 bottles of beer on the wall.'.freeze

  def initialize(number)
    @number = number
  end

  def to_s
    <<-VERSE
#{verse_start}
#{verse_end}
    VERSE
  end

  private

  def verse_start
    GENERIC_VERSE_PART_ONE.gsub('NUM_BOTTLES', num_bottles(number)).capitalize
  end

  def verse_end
    return ENDING_VERSE if number.zero?

    GENERIC_VERSE_PART_TWO.gsub('NUM_BOTTLES', num_bottles(number - 1)).gsub('TAKE_AMOUNT', take_amount(number - 1))
  end

  def num_bottles(n)
    num     = n.positive? ? n.to_s : 'no more'
    bottles = n == 1 ? 'bottle' : 'bottles'

    "#{num} #{bottles}"
  end

  def take_amount(n)
    n.zero? ? 'it' : 'one'
  end

  attr_reader :number
end
