class Hand

  def initialize
    @card_arr = [nil, nil, nil, nil, nil]
  end

  def to_s
    out_string = ""
    @card_arr.each do |card|
      if card
        out_string.concat(card.to_s + "  ")
      else
        out_string.concat("       ")
      end
    end
    out_string
  end

  def add_card(card)
    ind = 0
    ind += 1 until @card_arr[ind].nil?
    raise "Hand full" if ind == 5
    @card_arr[ind] = card
    self
  end

  def drop_card(index)
    @card_arr[index - 1] = nil
  end

  def empty
    @card_arr = [nil, nil, nil, nil, nil]
  end

  def card_count
    count = 0
    @card_arr.each do |card|
      count += 1 if card
    end
    count
  end

  # SCORES:
  # (-12..0) => high card
  # (1..13) => pairs
  # (14) => two pair
  # (15..27) => three of a kind
  # (28) => straight
  # (29) => flush
  # (30) => full house
  # (31..43) => four of a kind
  # (44) => straight flush
  def get_score
    flush = is_flush?
    straight = is_straight?
    pairs = pairs?

    return 45 if pairs.size == 1 && pairs[0][1] == 5
    return 44 if flush && straight
    return 31 + pairs[0][0] - 2 if pairs.size == 1 && pairs[0][1] == 4
    return 30 if pairs.size == 2 && (pairs[0][1] + pairs[1][1]) == 5
    return 29 if flush
    return 28 if straight
    return 15 + pairs[0][0] - 2 if pairs.size == 1 && pairs[0][1] == 3
    return 14 if pairs.size == 2
    return 1 + pairs[0][0] - 2 if pairs.size == 1
    -14 + high_card #high card return
  end

  def is_flush?
    suit = @card_arr[0].suit
    @card_arr.each do |card|
      return false unless card.suit == suit
    end
    true
  end

  def is_straight?
    card_values = self.sorted_values

    return true if card_values == [2, 3, 4, 5, 14]
    straight_start = card_values[0]

    ind = 1
    until ind == 5
      return false unless card_values[ind] - card_values[ind-1] == 1
      ind += 1
    end

    true
  end

  def pairs?
    card_values = self.sorted_values
    count = Array.new(14) { 0 }

    card_values.each do |value|
      count[value] += 1
    end

    pairs = []
    count.each_with_index do |num, value|
      pairs << [value, num] if num > 1
    end

    pairs
  end

  def high_card
    card_val = 0
    @card_arr.each do |card|
      card_val = card.value if card.value > card_val
    end
    card_val
  end

  def sorted_values
    card_values = []

    @card_arr.each do |card|
      card_values << card.value
    end

    card_values.sort!
  end

  def <=>(arg1)
    raise "Invalid comparison: not a hand" unless arg1.is_a?(Hand)
  end

  def cheat
    @card_arr = []
    5.times { @card_arr << Card.new(:S, 14) }
  end

end
