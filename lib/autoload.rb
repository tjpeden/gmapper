module GMapper
  
  module Autoload
    
    def autoload( const_name, path = nil )
      full_name = [self.name, const_name.to_s, path].compact.join('::')
      location = path || underscore( full_name )
      
      super const_name, location
    end
    
    # I take no credit for this, it's obviously ActiveSupport
    # code, just don't need the depenancy
    def underscore(camel_cased_word)
      word = camel_cased_word.to_s.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end
    
  end
  
end