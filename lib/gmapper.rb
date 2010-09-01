require 'uri'
require 'net/http'
require 'google/autoload'

unless [].respond_to? :extract_options!
  class Array
    def extract_options!
      last.is_a?(::Hash) ? pop : {}
    end
  end
end

module Google
  
  module Maps
    
    module Static
      extend Google::Autoload
      
      autoload :Map
      autoload :Marker
      
    end # => Static
    
  end # => Maps
  
end # => Static
