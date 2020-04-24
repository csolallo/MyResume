class Types::AddressType < Types::BaseObject
  field :address1, String, null: true
  field :address2, String, null: true
  field :city, String, null: true
  field :state, String, null: true
  field :zip, String, null: true
end
