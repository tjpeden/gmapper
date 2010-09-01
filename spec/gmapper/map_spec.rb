require 'spec_helper'

describe Google::Maps::Static::Map do
  it "should be able to create a proper url for given coordinates" do
    map = Google::Maps::Static::Map.new :center => [40.714728, -73.998672]
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=40.714728%2C-73.998672&zoom=12&size=400x400&sensor=false")
  end
  
  it "should be able to create a proper url for a given city and state" do
    options = {
      :center => "Berkeley,CA",
      :zoom => 14
    }
    
    map = Google::Maps::Static::Map.new options
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Berkeley%2CCA&zoom=14&size=400x400&sensor=false")
  end
  
  it "should be able to create a proper url for a given location with markers" do
    options = {
      :center => "Brooklyn Bridge,New York,NY",
      :zoom => 14,
      :size => [512, 512],
      :maptype => :roadmap
    }
    
    map = Google::Maps::Static::Map.new options
    map << Google::Maps::Static::Markers.new( [40.702147, -74.015794], :color => :blue, :label => 'S' )
    map << Google::Maps::Static::Markers.new( [40.711614, -74.012318], :color => :green, :label => 'G' )
    map << Google::Maps::Static::Markers.new( [40.718217, -73.998284], :color => :red, :label => 'C' )
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Brooklyn+Bridge%2CNew+York%2CNY&zoom=14&size=512x512&maptype=roadmap&markers=color%3Ablue%7Clabel%3AS%7C40.702147%2C-74.015794&markers=color%3Agreen%7Clabel%3AG%7C40.711614%2C-74.012318&markers=color%3Ared%7Clabel%3AC%7C40.718217%2C-73.998284&sensor=false")
  end
  
  it "should be able to create a proper url given multiple marker of the same style" do
    
    map = Google::Maps::Static::Map.new options
    map[:center] = "Williamsburg,Brooklyn,NY"
    map[:zoom] = 13
    map << Google::Maps::Static::Markers.new( '11211', '11206', '11222', :color => :blue, :label => 'S' )
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Williamsburg%2CBrooklyn%2CNY&zoom=13&size=400x400&markers=color%3Ablue%7Clabel%3AS%7C11211%7C11206%7C11222&sensor=false")
  end
  
  it "should be able to set parameters in the []= method" do
    map = Google::Maps::Static::Map.new
    map[:center] = "Berkeley,CA"
    map[:zoom] = 14
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Berkeley%2CCA&zoom=14&size=400x400&sensor=false")
  end
  
  it "should not be able to create a url without the :center parameter" do
    map = Google::Maps::Static::Map.new
    
    lambda do
      map.url
    end.should raise_error( GMapper::Error, "Must specify the center location." )
  end
end
