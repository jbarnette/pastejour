require "optparse"
require "pastejour"

module Pastejour
  class Cli
    attr_reader :name

    def initialize out, args
      @list     = false
      @multiple = false
      @run      = true
      @tee      = false
      @verbose  = false

      OptionParser.new do |opts|
        opts.on "--list", "-l", "List available pastes." do
          @list = true
        end

        opts.on "--help", "-h", "-?", "Show this help." do
          out.puts opts
          @run = false
        end

        opts.on "--multiple", "-m", "Allow multiple slurps when pasting." do
          @multiple = true
        end

        opts.on "--tee", "-t", "Tee to STDOUT when pasting." do
          @tee = true
        end

        opts.on "--version", "-V", "Prints #{Pastejour::VERSION}." do
          out.puts Pastejour::VERSION
          @run = false
        end

        opts.parse! args

        @name = args.shift

        yield self if @run && block_given?
      end
    end

    def list?
      @list
    end

    def multiple?
      @multiple
    end

    def run?
      @run
    end

    def tee?
      @tee
    end

    def verbose?
      @verbose
    end
  end
end
