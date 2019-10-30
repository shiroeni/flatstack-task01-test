# frozen_string_literal: true

require 'sequence/version'
require 'sequence/calculator'

# Collection of sequence calculators
module Sequence
  class Error < StandardError; end

  def print_next(sequence: nil)
    puts Calculator.new(sequence).next_sequence
  end
end
