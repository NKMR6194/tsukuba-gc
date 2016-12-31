# frozen_string_literal: true

require "rmagick"
require "tsukuba/gc/version"
require "tsukuba/gc/calendar"

module Tsukuba
  module GC
    module_function

    def parse(year, file_path)
      pages = Magick::Image.read(file_path)
      time = Time.new(year, 4)
      schedules = []

      12.times do |i|
        calendar = Calendar.new(time.year, time.month, pages[(i/4) + 1])
        schedules.concat(calendar.schedules)
        time = time.next_month
      end

      return schedules
    end
  end
end
