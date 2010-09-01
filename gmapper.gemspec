# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gmapper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Peden"]
  s.date = %q{2010-09-01}
  s.description = %q{A version agnostic library for the Google Maps API.}
  s.email = %q{tj.peden@tj-coding.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/gmapper.rb", "lib/google/autoload.rb", "lib/google/maps/static/map.rb", "lib/google/maps/static/marker.rb"]
  s.files = ["README.rdoc", "Rakefile", "gmapper.gemspec", "lib/gmapper.rb", "lib/google/autoload.rb", "lib/google/maps/static/map.rb", "lib/google/maps/static/marker.rb", "Manifest"]
  s.homepage = %q{http://github.com/tpeden/gmapper}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gmapper", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gmapper}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A version agnostic library for the Google Maps API.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
