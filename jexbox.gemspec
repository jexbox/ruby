# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jexbox"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jexbox team"]
  s.date = "2018-09-26"
  s.description = "This gem provides support for reporting errors to Jexbox"
  s.email = "support@jexbox.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "jexbox.gemspec",
    "lib/jexbox.rb",
    "lib/jexbox/configuration.rb",
    "lib/jexbox/middleware/notifier.rb",
    "lib/jexbox/payload.rb",
    "lib/jexbox/railtie.rb",
    "lib/jexbox/transport.rb",
    "lib/rails/generators/jexbox/jexbox_generator.rb",
    "lib/rails/templates/initializer.rb",
    "test/helper.rb",
    "test/test_jexbox.rb"
  ]
  s.homepage = "http://github.com/jexbox/jexbox-ruby"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.7.3"
  s.summary = "Ruby connector for Jexbox"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('2.7.3') then
      s.add_development_dependency(%q<bundler>, ["~> 1.16"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.3"])
      s.add_development_dependency(%q<minitest>, ["~> 5.11"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.16"])
      s.add_dependency(%q<jeweler>, ["~> 2.3"])
      s.add_dependency(%q<minitest>, ["~> 5.11"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.16"])
    s.add_dependency(%q<jeweler>, ["~> 2.3"])
    s.add_dependency(%q<minitest>, ["~> 5.11"])
  end
end

