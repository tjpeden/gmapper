require 'uri'
require 'cgi'
require 'net/http'
require 'autoload'
require 'exceptions'

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
      extend GMapper::Autoload
      
      autoload :Map
      autoload :Markers
      autoload :Path
      
      module Items
        extend GMapper::Autoload # Again?
        
        autoload :Base
        
      end
      
    end # => Static
    
  end # => Maps
  
end # => Google
