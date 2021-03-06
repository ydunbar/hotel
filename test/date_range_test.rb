require "date"
require_relative "test_helper"

describe "DateRange class" do
  before do
    @date_range = Hotel::DateRange.new(check_in: Date.new(2020, 2, 24), check_out: Date.new(2020, 2, 25))
    @other_date_range = Hotel::DateRange.new(check_in: Date.new(2020, 3, 24), check_out: Date.new(2020, 3, 25))
  end

  describe "DateRange instantiation" do
    it "is an instance of DateRange" do
      expect(@date_range).must_be_kind_of Hotel::DateRange
    end
    it "Raises exception for invalid input" do
      start_date = Date.today
      end_date = Date.new(2020, 2, 24) # earlier than start_date
      expect { Hotel::DateRange.new(check_in: start_date, check_out: end_date) }.must_raise ArgumentError
    end
  end

  describe "overlap?" do
    it "checks for schedule conflict" do
      expect(@date_range.overlap?(@date_range)).must_equal true
      expect(@date_range.overlap?(@other_date_range)).must_equal false
    end
  end

  describe "include?" do
    it "returns true if date has a reservation" do
      expect(@date_range.include?(Date.new(2020, 2, 24))).must_equal true
      expect(@date_range.include?(Date.new(2020, 2, 26))).must_equal false
    end
  end
end
