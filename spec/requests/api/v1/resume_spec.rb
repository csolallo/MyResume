require 'swagger_helper'

RSpec.describe 'api/v1/resume', type: :request do
    not_found_proc = Proc.new {
      let(:id) { 1337 }
      run_test!
  }

  path '/api/v1/resume/{id}/jobs' do
    parameter name: 'id', in: :path, required: true, type: :integer, description: 'id of the desired resume'
    parameter name: 'since', in: :query, type: :string, required: false, description: 'only list jobs on or after this date'

    get('jobs') do
      description 'Get job details for the resume'
      tags 'Resume'

      response(200, 'queried using a valid resume id') do
        produces 'application/json'
        let(:id) { 1 }

        schema type: 'object', 
          required: %w(companies jobs),
          properties: {
            companies: {
              type: 'array', items: {
                '$ref' => '#/components/schemas/company'
              }
            },
            jobs: {
              type: 'array', items: {
                '$ref' => '#/components/schemas/job'
              }
            }
          }
          
        run_test!
      end

      response 404, 'queried using an invalid resume id', &not_found_proc
    end
  end


  # path '/api/v1/resume/{id}/tags/{tags}/jobs' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'
  #   parameter name: 'tags', in: :path, type: :string, description: 'tags'

  #   get('jobs_by_tags resume') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }
  #       let(:tags) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

end
