Gem::Specification.new do |s|
  s.name = %q{pastejour}
  s.version = "1.0.0.200808041733"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Barnette", "Evan Phoenix"]
  s.autorequire = %q{pastejour}
  s.date = %q{2008-08-04}
  s.default_executable = %q{pastejour}
  s.description = %q{Broadcast standard out.}
  s.email = %q{jbarnette@rubyforge.org}
  s.executables = ["pastejour"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "bin/pastejour", "lib/pastejour", "lib/pastejour/version.rb", "lib/pastejour.rb", "spec/helper.rb", "spec/pastejour", "spec/pastejour/pastejour_spec.rb", "spec/spec.opts"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jbarnette/pastejour}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Broadcast standard out.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<dnssd>, [">= 0.6.0"])
    else
      s.add_dependency(%q<dnssd>, [">= 0.6.0"])
    end
  else
    s.add_dependency(%q<dnssd>, [">= 0.6.0"])
  end
end
