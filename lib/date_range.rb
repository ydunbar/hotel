require "date"

module Hotel
  class DateRange
    attr_accessor :check_in, :check_out
    attr_reader :nights

    def initialize(check_in:, check_out:)
      if check_out != nil
        if check_out > check_in
          @check_in = check_in
          @check_out = check_out
        else
          raise ArgumentError, "Start date must be before end date"
        end
      end
      @nights = (@check_out - @check_in).to_i
    end

    def overlap?(new_date_range)
      if (new_date_range.check_in >= self.check_out || new_date_range.check_out <= self.check_in)
        return false
      else
        return true
      end
    end

    def include?(one_day)
      return one_day >= self.check_in && one_day < self.check_out
    end
  end
end
