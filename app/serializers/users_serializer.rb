class UsersSerializer
  include FastJsonapi::ObjectSerializer
  set_type :users
  set_id :id
  attributes :email, :api_key
end
