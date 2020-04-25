class Types::JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :company, Types::CompanyType, null: false
end
