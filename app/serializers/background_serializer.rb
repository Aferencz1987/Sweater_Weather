class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type :image
  attributes :image
end
