require "rubygems"
require "hoe"

Hoe.plugins.delete :rubyforge
Hoe.plugin :doofus, :git

Hoe.spec "pastejour" do
  developer "John Barnette", "code@jbarnette.com"
  developer "Evan Phoenix",  "evan@fallingsnow.net"

  self.extra_rdoc_files = FileList["*.rdoc"]
  self.history_file     = "CHANGELOG.rdoc"
  self.readme_file      = "README.rdoc"
  self.testlib          = :minitest

  extra_deps << ["dnssd", ">= 1.3.1"]
end
