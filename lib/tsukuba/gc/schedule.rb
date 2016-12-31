# frozen_string_literal: true

module Tsukuba
  module GC
    class Schedule
      TYPES = {
        none: "収集なし",
        burnable: "燃やせるごみ",
        used_paper: "古紙・古衣",
        glass: "びん・スプレー容器",
        spray: "びん・スプレー容器",
        pet: "ペットボトル",
        oversized: "粗大ごみ",
        cans: "かん",
        non_burnale: "燃やせないごみ",
      }.freeze

      attr_reader :time, :type

      def initialize(time, type)
        @time = time.clone.freeze
        @type = type
      end

      def type_ja
        TYPES[@type]
      end
    end
  end
end
