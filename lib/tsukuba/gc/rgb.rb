# frozen_string_literal: true

module Tsukuba
  module GC
    class RGB
      attr_reader :r, :g, :b

      def initialize(red, green, blue)
        @r = red
        @g = green
        @b = blue
      end

      COLORS = {
        none: RGB.new(255, 255, 255),
        burnable: RGB.new(255, 137, 171),
        used_paper: RGB.new(0, 130, 70),
        glass: RGB.new(234, 241, 86),
        spray: RGB.new(255, 168, 42),
        pet: RGB.new(146, 218, 229),
        oversized: RGB.new(193, 180, 135),
        cans: RGB.new(212, 213, 214),
        non_burnale: RGB.new(37, 83, 159),
      }.freeze

      def type
        kind = nil
        min_dist = nil

        COLORS.each do |key, rgb|
          d = dist(rgb)
          if min_dist.nil? || min_dist > d
            min_dist = d
            kind = key
          end
        end

        return kind
      end

      private

      def dist(rgb)
        dr = @r - rgb.r
        dg = @g - rgb.g
        db = @b - rgb.b
        return dr * dr + dg * dg + db * db
      end
    end
  end
end
