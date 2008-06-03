require "fileutils"
require "rubygems"
require "rake/gempackagetask"
require "spec/rake/spectask"

require "./lib/pastejour/version.rb"

pastejour_gemspec = Gem::Specification.new do |s|
  s.name             = "pastejour"
  s.version          = Pastejour::VERSION
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.summary          = "Broadcast standard out."
  s.description      = s.summary
  s.author           = "John Barnette"
  s.email            = "jbarnette@rubyforge.org"
  s.homepage         = "http://github.com/jbarnette/pastejour"
  s.require_path     = "lib"
  s.autorequire      = "pastejour"
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,spec}/**/*")
  
  s.add_dependency "dnssd", ">= 0.6.0"
end

Rake::GemPackageTask.new(pastejour_gemspec) do |pkg|
  pkg.gem_spec = pastejour_gemspec
end

namespace :gem do
  namespace :spec do
    desc "Update pastejour.gemspec"
    task :generate do
      File.open("pastejour.gemspec", "w") do |f|
        f.puts(pastejour_gemspec.to_ruby)
      end
    end
  end
end

task :install => :package do
  sh %{sudo gem install pkg/pastejour-#{Pastejour::VERSION}}
end

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
  t.spec_opts = ["--options", "spec/spec.opts"]
end

task :default => :spec

desc "Remove all generated artifacts"
task :clean => :clobber_package
