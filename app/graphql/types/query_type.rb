module Types
  class QueryType < GraphQL::Schema::Object
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
