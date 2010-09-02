require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'echoe'
require 'spec/rake/spectask'

Echoe.new( 'gmapper', '0.2.0' ) do |p|
  p.author          = "TJ Peden"
  p.email           = "tj.peden@tj-coding.com"
  p.summary         = "A version agnostic, dependency free Ruby library for the Google Maps API."
  p.description     = <<-EOS
A (mostly) version agnostic, dependency free Ruby library for the Google Maps API.

Currently only supports Google Static Maps.
EOS
  p.url             = "http://github.com/tpeden/gmapper"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Spec::Rake::SpecTask.new(:html) do |t|
  t.warning = true
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(--format html:doc/reports/tools/failing_examples.html)
  t.fail_on_error = false
end

Spec::Rake::SpecTask.new(:nested) do |t|
  # t.warning = true
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w{--backtrace --format nested --color}
  t.fail_on_error = false
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
