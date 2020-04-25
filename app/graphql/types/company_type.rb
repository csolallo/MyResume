class Types::CompanyType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :address, Types::AddressType, null: false

  def address
    {
        address1: object.address1,
        address2: object.address2,
        city: object.city,
        state: object.state,
        zip: object.zip,
    }
  end
end