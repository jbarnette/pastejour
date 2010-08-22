require "minitest/autorun"
require "pastejour/cli"
require "stringio"

module Pastejour
  class CliTest < MiniTest::Unit::TestCase
    def pastejour *args
      stdout = StringIO.new
      cli    = Cli.new stdout, args

      [cli, stdout.string]
    end

    def test_help
      opts, out = pastejour "--help"
      assert !opts.run?, "shouldn't run when asking for help"
    end

    def test_version
      _, out = pastejour "--version"
      assert_equal Pastejour::VERSION, out.strip
    end
  end
end
