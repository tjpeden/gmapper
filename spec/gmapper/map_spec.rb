require 'spec_helper'

describe Google::Maps::Static::Map do
  it "should be able to create a proper url for a given coordinates" do
    map = Google::Maps::Static::Map.new :center => [40.714728, -73.998672], :zoom => 12
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=40.714728,-73.998672&zoom=12&size=400x400&sensor=false")
  end
  
  it "should be able to create a proper url for a given city and state" do
    options = {
      :center => "Berkeley,CA",
      :zoom => 14
    }
    
    map = Google::Maps::Static::Map.new options
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Berkeley,CA&zoom=14&size=400x400&sensor=false")
  end
  
  it "should be able to create a proper url given a location with markers" do
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
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=14&size=512x512&maptype=roadmap&markers=color:blue|label:S|40.702147,-74.015794&markers=color:green|label:G|40.711614,-74.012318&markers=color:red|label:C|40.718217,-73.998284&sensor=false")
  end
  
  it "should be able to create a proper url given a location with multiple marker of the same style" do
    map = Google::Maps::Static::Map.new
    map[:center] = "Williamsburg,Brooklyn,NY"
    map[:zoom] = 13
    map << Google::Maps::Static::Markers.new( '11211', '11206', '11222', :color => :blue, :label => 'S' )
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Williamsburg,Brooklyn,NY&zoom=13&size=400x400&markers=color:blue|label:S|11211|11206|11222&sensor=false")
  end
  
  it "should be able to create a proper url given a location with a path" do
    locations = [ [40.737102,-73.990318], [40.749825,-73.987963], [40.752946,-73.987384], [40.755823,-73.986397] ]
    map = Google::Maps::Static::Map.new
    map[:size] = [512, 512]
    map << Google::Maps::Static::Path.new( *locations, :color => '0x0000ff', :weight => 5 )
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?path=color:0x0000ff|weight:5|40.737102,-73.990318|40.749825,-73.987963|40.752946,-73.987384|40.755823,-73.986397&size=512x512&sensor=false")
  end
  
  it "should be able to create a proper url given a viewport (visible)" do
    locations = %w{77+Massachusetts+Ave,Cambridge,MA Harvard+Square,Cambridge,MA}
    map = Google::Maps::Static::Map.new
    map[:size] = [512, 512]
    map << Google::Maps::Static::Visible.new( *locations )
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?visible=77+Massachusetts+Ave,Cambridge,MA|Harvard+Square,Cambridge,MA&size=512x512&sensor=false")
  end
  
  it "should be able to set parameters in the Map#[]= method" do
    map = Google::Maps::Static::Map.new
    map[:center] = "Berkeley,CA"
    map[:zoom] = 14
    
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Berkeley,CA&zoom=14&size=400x400&sensor=false")
  end
  
  it "should be able to encode the url for use with URI#parse (in Map#save)" do
    map = Google::Maps::Static::Map.new
    map[:center] = "Williamsburg,Brooklyn,NY"
    map[:zoom] = 13
    map << Google::Maps::Static::Markers.new( '11211', '11206', '11222', :color => :blue, :label => 'S' )
    
    map.url._encode.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Williamsburg,Brooklyn,NY&zoom=13&size=400x400&markers=color:blue%7Clabel:S%7C11211%7C11206%7C11222&sensor=false")
  end
  
  it "should not be able to create a url without the :center parameter" do
    map = Google::Maps::Static::Map.new
    
    lambda do
      map.url
    end.should raise_error( GMapper::Error, "Must specify the center location unless you add one or more map items." )
  end
end
