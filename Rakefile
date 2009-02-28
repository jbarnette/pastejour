require "rubygems"
require "hoe"

require "./lib/pastejour/version.rb"

Hoe.new "pastejour", Pastejour::VERSION do |p|
  p.developer "John Barnette", "jbarnette@rubyforge.org"

  p.url              = "http://github.com/jbarnette/pastejour"
  p.history_file     = "CHANGELOG.rdoc"
  p.readme_file      = "README.rdoc"
  p.extra_rdoc_files = [p.readme_file]
  p.need_tar         = false
  p.test_globs       = %w(test/**/*_test.rb)
  p.testlib          = :minitest

  p.extra_deps << "dnssd"
end
