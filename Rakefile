require "rubygems"
require "hoe"

Hoe.plugin :git

Hoe.spec "pastejour" do
  developer "John Barnette", "jbarnette@rubyforge.org"
  developer "Evan Phoenix",  "evan@fallingsnow.net"

  self.extra_rdoc_files = FileList["*.rdoc"]
  self.history_file     = "CHANGELOG.rdoc"
  self.readme_file      = "README.rdoc"
  self.testlib          = :minitest

  extra_deps << "dnssd"
end
