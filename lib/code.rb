require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |ch| POSSIBLE_PEGS.include?(ch.upcase) } ? true : false
  end

  def self.random(length)
    rand_chars_arr = []
    length.times { rand_chars_arr << POSSIBLE_PEGS.keys.sample }
    Code.new(rand_chars_arr)
  end

  def self.from_string(pegs_string)
    Code.new(pegs_string.split(""))
  end

  attr_reader :pegs

  def initialize(chars_arr)
    raise unless Code.valid_pegs?(chars_arr)
    @pegs = chars_arr.map(&:upcase)
  end

  def [](index)
    self.pegs[index]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess_code_inst)
    guess_arr = guess_code_inst.pegs
    correct_count = 0
    guess_arr.each_with_index do |peg, idx|
      correct_count += 1 if guess_arr[idx] == self.pegs[idx]
    end
    correct_count
  end
  
  def num_near_matches(guess_code_inst)
    guess_arr = guess_code_inst.pegs
    near_count = 0
    guess_arr.each_with_index do |peg, idx|
      if self.pegs.include?(guess_arr[idx])
        unless guess_arr[idx] == self.pegs[idx]
          near_count += 1 
        end
      end
    end
    near_count
  end

  def ==(arg_inst)
    self.pegs == arg_inst.pegs
  end

  
end
