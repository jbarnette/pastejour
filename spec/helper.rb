$LOAD_PATH.unshift(File.expand_path("#{File.dirname(__FILE__)}/../lib"))

require "spec"
require "pastejour"

module Spec::Expectations::ObjectExpectations
  alias_method :must, :should
  alias_method :must_not, :should_not
  undef_method :should
  undef_method :should_not
end
