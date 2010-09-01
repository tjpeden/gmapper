module Google
  
  module Maps
    
    module Static
      
      class Markers
        
        def initialize *args
          @options = args.extract_options!
          
          raise "Must specify one or more points to place markers" if args.empty?
          
          @locations = args
        end
        
        def to_s
          result = @options.map do |key, value|
            "#{key.to_s}:#{value.to_s}"
          end.join('|') + '|'
          
          result += @locations.map do |loc|
            loc.is_a?(Array) ? loc.join(',') : loc.to_s
          end.join('|')
          
          "markers=" + ::CGI.escape( result )
        end
        
      end # => Google::Maps::Static::Marker
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
