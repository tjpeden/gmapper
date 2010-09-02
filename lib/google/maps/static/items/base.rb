module Google
  
  module Maps
      
    module Static
      
      module Items
        
        class Base
          
          def initialize *args
            @options = args.extract_options!
            
            raise GMapper::Error, "One or more locations is required for the feature." if args.empty?
            @locations = args
            @item = self.class.name.split('::').last.downcase
          end
          
          def to_s
            raise GMapper::Error, "@item cannot be nil!" if @item.nil?
            
            result = @options.map do |key, value|
              "#{key.to_s}:#{value.to_s}|"
            end.join
            
            result += @locations.map do |loc|
              loc.is_a?(Array) ? loc.join(',') : loc.to_s
            end.join('|')
            
            "#{@item}=#{result}"
          end
          
        end # => Google::Maps::Static::Items::Base
          
      end # => Google::Maps::Static::Items
        
    end # => Google::Maps::Static
      
  end # => Google::Maps
    
end # => Google