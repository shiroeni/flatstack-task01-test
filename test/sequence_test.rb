# frozen_string_literal: true

require 'test_helper'

class TestCalculator < Minitest::Test
  def test_return_correct_line1
    assert_equal '21', Sequence::Calculator.new('11').next_sequence
  end

  def test_return_correct_line2
    assert_equal '1211', Sequence::Calculator.new('21').next_sequence
  end

  def test_return_correct_line3
    assert_equal '111221', Sequence::Calculator.new('1211').next_sequence
  end
end
