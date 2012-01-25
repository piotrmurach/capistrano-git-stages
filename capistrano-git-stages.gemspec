# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano/git/version"

Gem::Specification.new do |s|
  s.name        = "capistrano-git-stages"
  s.version     = Capistrano::Git::Stages::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Piotr Murach"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{Add git tasks scoped by stages env}
  s.description = %q{Add git tasks scoped by stages env}

  s.rubyforge_project = "capistrano-git-stages"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'capistrano'
end
