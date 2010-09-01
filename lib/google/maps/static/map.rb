module Google
  
  module Maps
    
    module Static
      
      class Map
        attr_reader :markers
        
        def initialize *args
          @base = "http://maps.google.com/maps/api/staticmap"
          
          @options = args.extract_options!
          @options[:sensor] = false unless @options.key?(:sensor)
          
          @markers = []
        end
        
        def save file
          response = ::Net::HTTP.get( ::URI.parse( url ) )
          File.open( file, 'wb' ) { |f| f.write response }
        end
        
        def url
          @url ||= "#{@base}?#{parameters}"
        end
        alias_method :to_s, :url
        
        private
          def parameters
            result = @options.map do |key, object|
              value = case key
              when :center
                object.is_a?( Array ) ? object.join(',') : object.to_s
              when :size
                object.is_a?( Array ) ? object.join('x') : object.to_s
              else object.to_s
              end
              
              "#{::URI.escape( key.to_s )}=#{::URI.escape( value )}"
            end.join('&')
            
            result += '&' + @markers.map(&:to_s).join('&') unless @markers.empty?
            
            result
          end
      end # => Google::Maps::Static::Map
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
