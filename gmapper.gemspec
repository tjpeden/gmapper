# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gmapper}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Peden"]
  s.date = %q{2010-09-02}
  s.description = %q{A (mostly) version agnostic, dependency free Ruby library for the Google Maps API.

Currently only supports Google Static Maps.
}
  s.email = %q{tj.peden@tj-coding.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/autoload.rb", "lib/exceptions.rb", "lib/gmapper.rb", "lib/google/maps/static/items/base.rb", "lib/google/maps/static/map.rb", "lib/google/maps/static/markers.rb", "lib/google/maps/static/path.rb", "lib/google/maps/static/visible.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/autoload.rb", "lib/exceptions.rb", "lib/gmapper.rb", "lib/google/maps/static/items/base.rb", "lib/google/maps/static/map.rb", "lib/google/maps/static/markers.rb", "lib/google/maps/static/path.rb", "lib/google/maps/static/visible.rb", "spec/gmapper/map_spec.rb", "spec/matchers.rb", "spec/spec_helper.rb", "Manifest", "gmapper.gemspec"]
  s.homepage = %q{http://github.com/tpeden/gmapper}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gmapper", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gmapper}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A version agnostic, dependency free Ruby library for the Google Maps API.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
