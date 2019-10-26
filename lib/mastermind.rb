require "byebug"

require_relative "code"

class Mastermind

  attr_reader :secret_code

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_inst)
    print self.secret_code.num_exact_matches(code_inst)
    print self.secret_code.num_near_matches(code_inst)
  end

  def ask_user_for_guess
    print "Enter a code: "
    input = gets.chomp
    input_code_inst = Code.from_string(input)
    self.print_matches(input_code_inst)
    input_code_inst.pegs == self.secret_code.pegs
  end

end
