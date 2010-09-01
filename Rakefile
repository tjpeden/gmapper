require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new( 'gmapper', '0.1.0' ) do |p|
  p.description     = "A version agnostic library for the Google Maps API."
  p.url             = "http://github.com/tpeden/gmapper"
  p.author          = "TJ Peden"
  p.email           = "tj.peden@tj-coding.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
