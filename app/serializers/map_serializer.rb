class MapSerializer
  include FastJsonapi::ObjectSerializer
  set_id :providedlocation

  attributes :latitude, :longitude
end
