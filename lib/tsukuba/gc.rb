# frozen_string_literal: true

require "rmagick"
require "tsukuba/gc/version"
require "tsukuba/gc/calendar"
require "tsukuba/gc/cli"

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

    def generate_json_object(schedules)
      schedules.map { |schedule| {date: schedule.time.to_s, type: schedule.type_ja} }
    end

    def dump_json(schedules, io = nil)
      obj = generate_json_object(schedules)
      json_str = JSON.pretty_generate(obj) + "\n"

      if io.nil?
        json_str
      else
        io.write(json_str)
      end
    end
  end
end
