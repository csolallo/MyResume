module Types
  class QueryType < GraphQL::Schema::Object
    field :person, PersonType, null: false do
      description "Find a person by ID"
      argument :name, String, required: true
    end

    def person(name:)
      Person.find_by_name(name)
    end
  end
end
