class Types::PersonType < Types::BaseObject
  description "A person. Owner of a resume."

  field :id, ID, null: false
  field :name, String, null: false
  field :phone, String, null: true
  field :email, String, null: true

  def phone
    object.number 
  end
end