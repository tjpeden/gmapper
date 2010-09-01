require 'active_support/inflector'

module Google
  
  module Autoload
    
    def autoload( const_name, path = nil )
      full_name = [self.name, const_name.to_s, path].compact.join('::')
      location = path || ActiveSupport::Inflector.underscore( full_name )
      
      super const_name, location
    end
    
  end
  
end