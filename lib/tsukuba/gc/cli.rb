# frozen_string_literal: true

require "optparse"
require "tsukuba/gc"

module Tsukuba
  module GC
    module CLI
      BANNER = "Usage: tsukuba-gc [options] file year"

      module_function

      def run(argv = ARGV)
        output = nil
        opt = OptionParser.new(BANNER)
        opt.version = Tsukuba::GC::VERSION
        opt.separator("Options:")
        opt.on("-o <file>", "結果を<file>に出力する") { |v| output = v }
        opt.on_tail("-h", "--help", "ヘルプを出力する") do
          puts opt
          exit
        end

        opt.on_tail("--version", "バージョンを表示する") do
          puts opt.ver
          exit
        end

        argv = opt.parse(argv)

        if argv.length < 2
          puts "Error: 引数が不足しています"
          puts
          puts opt.help
          exit(1)
        end

        file_path = argv[0]
        year = argv[1].to_i

        schedules = Tsukuba::GC.parse(year, file_path)
        if output.present?
          open(output, "w") do |f|
            Tsukuba::GC.dump_json(schedules, f)
          end
        else
          Tsukuba::GC.dump_json(schedules, STDOUT)
        end
      end
    end
  end
end
