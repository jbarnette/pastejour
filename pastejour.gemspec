Gem::Specification.new do |s|
  s.name = %q{pastejour}
  s.version = "1.0.2"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Barnette", "Evan Phoenix"]
  s.autorequire = %q{pastejour}
  s.date = %q{2008-06-03}
  s.default_executable = %q{pastejour}
  s.description = %q{Broadcast standard out.}
  s.email = %q{jbarnette@rubyforge.org}
  s.executables = ["pastejour"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "bin/pastejour", "lib/pastejour", "lib/pastejour/version.rb", "lib/pastejour.rb", "spec/helper.rb", "spec/pastejour", "spec/pastejour/pastejour_spec.rb", "spec/spec.opts"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jbarnette/pastejour}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{Broadcast standard out.}

  s.add_dependency(%q<dnssd>, [">= 0.6.0"])
end
