module Google
  
  module Maps
    
    module Static
      
      class Map
        attr_accessor :timeout
        
        def initialize *args
          @base = "http://maps.google.com/maps/api/staticmap"
          
          @options = {
            # :zoom   => 12,
            :size   => [400, 400],
            :sensor => false
          }
          @options.merge! args.extract_options!
          
          @items = args.select { |item| item.is_a?(Items::Base) }.map(&:to_s)
        end
        
        def []= key, value
          @options[key] = value
          @url = nil if @url # Object has become dirty, url should be regenerated
        end
        
        def << item
          raise GMapper::Error, "Please only use Items::Base decendants." unless item.is_a?(Items::Base)
          @items << item.to_s
          @url = nil if @url # Object has become dirty, url should be regenerated
        end
        alias_method :add_item, :<<
        
        def save file
          uri = ::URI.parse( url._encode )
          http = ::Net::HTTP.new( uri.host, uri.port )
          http.read_timeout = @timeout if @timeout
          
          response = http.get( "#{uri.path}?#{uri.query}" )
          File.open( file, 'wb' ) { |f| f.write response.body }
        end
        
        def url
          unless @options.key?(:center) || !@items.empty?
            raise GMapper::Error, "Must specify the center location unless you add one or more map items."
          end
          
          unless @options.key?(:zoom) || !@items.empty?
            raise GMapper::Error, "Must specify the zoom level unless you add one or more map items."
          end
          
          if @url.nil?
            url = "#{@base}?#{parameters}"
            
            def url._encode
              gsub(/\|/) { |match| '%' + match.unpack('H2').join.upcase }
            end
            
            @url = url
          end
          
          @url
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
              
              "#{key.to_s}=#{value}"
            end.join('&')
            
            result += '&' + @items.join('&') unless @items.empty?
            
            result.gsub!(' ', '+')
            
            result.split(/&(?=[a-z]+=)/).map { |param| param.gsub('&', '%26') }.join('&')
          end
      end # => Google::Maps::Static::Map
      
    end # => Google::Maps::Static
    
  end # => Google::Maps
  
end # => Google
