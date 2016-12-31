# frozen_string_literal: true

require "active_support"
require "active_support/core_ext"
require "tsukuba/gc/rgb"
require "tsukuba/gc/schedule"

module Tsukuba
  module GC
    class Calendar
      def initialize(year, month, img)
        @img = img
        @time = Time.new(year, month, 1)

        # base pixel
        @x = 143
        @y = 122

        # size of a cell
        @dx = 84
        @dy = 50

        # focus to a calendar
        if (month % 4) % 2 == 1
          # shift down
          @y += 314
        end
        if (month % 4) >= 2
          # shift right
          @x += 560
        end

        # when 5 weeks in a month
        if @time.end_of_month.day == 31 && (@time.saturday? || @time.friday?)
          @dy = 44
        end

        # focus to a cell of day 1
        if @time.saturday?
          @y += 25
        elsif @time.sunday?
          # skip
        else
          @x += @dx * (@time.wday - 1)
        end
      end

      def schedules
        return @schedules if @schedules.present?

        @schedules = []

        @time.end_of_month.day.times do
          if @time.sunday? || @time.saturday?
            @schedules << Schedule.new(@time, :none)
            @time = @time.next_day
            next
          end

          pixel = @img.get_pixels(@x, @y, 1, 1)[0]
          rgb = RGB.new(pixel.red / 257, pixel.green / 257, pixel.blue / 257)

          @schedules << Schedule.new(@time, rgb.type)

          if @time.friday?
            @y += @dy
            @x -= @dx * 4
          else
            @x += @dx
          end
          @time = @time.next_day
        end

        return @schedules
      end
    end
  end
end
