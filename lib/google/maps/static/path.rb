module Google
  
  module Maps
    
    module Static
      
      class Path < Items::Base
        
        def initialize *args
          super
          @item = 'path'
        end
        
      end # => Google::Maps::Static::Marker
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
