require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'echoe'
require 'spec/rake/spectask'

Echoe.new( 'gmapper', '0.1.0' ) do |p|
  p.description     = "A version agnostic library for the Google Maps API."
  p.url             = "http://github.com/tpeden/gmapper"
  p.author          = "TJ Peden"
  p.email           = "tj.peden@tj-coding.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Spec::Rake::SpecTask.new(:html) do |t|
  t.warning = true
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(--format html:doc/reports/tools/failing_examples.html --diff)
  t.fail_on_error = false
end

Spec::Rake::SpecTask.new(:nested) do |t|
  # t.warning = true
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w{--backtrace --format nested --diff --color}
  t.fail_on_error = false
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
