require 'uri'
require 'cgi'
require 'net/http'
require 'google/autoload'

unless [].respond_to? :extract_options!
  class Array
    def extract_options!
      last.is_a?(::Hash) ? pop : {}
    end
  end
end

module GMapper
  
  autoload :Error, 'exceptions'
  
end

module Google
  
  module Maps
    
    module Static
      extend Google::Autoload
      
      autoload :Map
      autoload :Markers
      
    end # => Static
    
  end # => Maps
  
end # => Static
