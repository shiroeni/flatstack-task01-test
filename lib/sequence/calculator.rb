# frozen_string_literal: true

module Sequence
  # Calculate next sequence from current one
  class Calculator
    attr_reader :old_sequence

    # @param [String, Integer] number Number for generates new sequence
    def initialize(seq)
      @old_sequence = seq.to_s

      self.recc = 1
      self.old_num = old_sequence[0]
    end

    # Memoize #calculate_sequence result
    #
    # @return [String]
    def next_sequence
      @next_sequence ||=
        calculate_sequence
    end

    protected

    attr_accessor :recc, :old_num

    # Calculates next sequence from current
    #
    # @return [String]
    def calculate_sequence
      old_sequence.split('')[1..-1].each(&method(:fill_recurrence))

      apply_recurrence

      recurrences.flatten.join
    end

    # Fills #recurrences for new sequence
    #
    # @return [nil]
    def fill_recurrence(number)
      if old_num == number
        self.recc += 1
      else
        apply_recurrence
        self.old_num = number
        self.recc = 1
      end
    end

    def apply_recurrence
      recurrences.push([recc, old_num])
    end

    def recurrences
      @recurrences ||= []
    end
  end
end
