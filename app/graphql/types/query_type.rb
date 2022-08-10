module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :person, PersonType, null: true do
      description 'Query a person by name'
      argument :name, String, required: true
    end
  
    field :resume, ResumeType, null: true do
      description 'Query for a person''s resume'
      argument :name, String, required: true
    end
  
    def person(name:)
      Person.find_by_name(name)
    end
  
    def resume(name:)
      Person.find_by_name(name).resume
    end
  end
end
