module Google
  
  module Maps
    
    module Static
      
      class Map
        def initialize *args
          @base = "http://maps.google.com/maps/api/staticmap"
          
          @options = {
            :zoom   => 12,
            :size   => [400, 400],
            :sensor => false
          }
          @options.merge! args.extract_options!
          
          @markers = []
        end
        
        def []= key, value
          @options[key] = value
        end
        
        def << markers
          raise GMapper::Error, "This method only accepts Markers objects" unless markers.is_a?(Markers)
          @markers << markers
        end
        alias_method :add_markers, :<<
        
        def save file
          response = ::Net::HTTP.get( ::URI.parse( url ) )
          File.open( file, 'wb' ) { |f| f.write response }
        end
        
        def url
          raise GMapper::Error, "Must specify the center location." unless @options.key? :center
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
              
              "#{::CGI.escape( key.to_s )}=#{::CGI.escape( value )}"
            end.join('&')
            
            result += '&' + @markers.map(&:to_s).join('&') unless @markers.empty?
            
            result
          end
      end # => Google::Maps::Static::Map
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
