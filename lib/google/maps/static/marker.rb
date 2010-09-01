module Google
  
  module Maps
    
    module Static
      
      class Marker
        
        def initialize *args
          @options = args.extract_options!
          
          raise "Must specify one or more points to place markers" if args.empty?
          
          @locations = args
        end
        
        def to_s
          result = "markers="
          
          result += @options.inject('') do |output, pair|
            output + "#{pair.first.to_s}:#{pair.last.to_s}|"
          end
          
          result += @locations.map do |loc|
            loc.is_a?(Array) ? log.join(',') : loc.to_s
          end.join('|')
          
          ::URI.encode( result )
        end
        
      end # => Google::Maps::Static::Marker
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
