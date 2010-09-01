require 'spec_helper'

describe Google::Maps::Static::Map do
  it "should be able to create a proper url for given coordinates" do
    map = Google::Maps::Static::Map.new :center => [40.714728, -73.998672]
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
  
  it "should be able to create a proper url for a given location with markers" do
    options = {
      :center => "Brooklyn Bridge,New York,NY",
      :zoom => 14,
      :size => [512, 512],
      :maptype => :roadmap
    }
    
    map = Google::Maps::Static::Map.new options
    map.markers << Google::Maps::Static::Marker.new( [40.702147, -74.015794], :color => :blue, :label => 'S' )
    map.markers << Google::Maps::Static::Marker.new( [40.711614, -74.012318], :color => :green, :label => 'G' )
    map.markers << Google::Maps::Static::Marker.new( [40.718217, -73.998284], :color => :red, :label => 'C' )
    map.url.should orderlessly_match("http://maps.google.com/maps/api/staticmap?center=Brooklyn%20Bridge,New%20York,NY&zoom=14&size=512x512&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&sensor=false")
  end
end
