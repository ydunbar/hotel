require "date"
require_relative "reservation"
require_relative "date_range"

module Hotel
  class Block
    attr_reader :date_range, :rooms, :discounted_rate

    def initialize(date_range:, rooms:, discounted_rate:)
      @date_range = date_range
      if rooms.length < 2 || rooms.length > 5
        raise ArgumentError, "Please provide between 2-5 rooms"
      end
      possible_rooms = (1..20).to_a # call find_available_rooms
      # if !(possible_rooms.include?(rooms.each)) raise ArgumentError, "Please provide valid room numbers" end
      @rooms = rooms # array of room numbers
      # if discounted_rate.class != Integer && discounted_rate.class != Float raise ArgumentError, "Please enter valid number" end
      @discounted_rate = discounted_rate
      @reservations = []
    end

    def reserve_room(room)
      reservation = Reservation.new(date_range: self.date_range, room: room)
      @reservations << reservation
      return reservation
    end
  end
end