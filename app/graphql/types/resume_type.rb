class Types::ResumeType < Types::BaseObject
  description "Top-level object for a resume"

  field :id, ID, null: false
  field :jobs, [Types::JobType], null: false do
    argument :since,  GraphQL::Types::ISO8601Date, required: false
    argument :limit, Int, required: false
  end

  def jobs(since:, limit:)
    if !since.nil?
      limit.nil? ? object.jobs.since(since) : object.jobs.since(since).limit(limit) 
    else
      limit.nil? ? object.jobs : object.jobs.limit(limit)  
    end
  end
end
