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

      response 200, 'queried using a valid resume id' do
        produces 'application/json'
        let(:id) { 1 }

        schema '$ref' => '#/components/schemas/resume' 
          
        run_test!
      end

      response 404, 'queried using an invalid resume id', &not_found_proc
    end
  end

  path '/api/v1/resume/{id}/tags' do
    parameter name: :id, in: :path, type: :integer, required: true, description: 'id of the desired resume' 

    get('tags') do
      description 'Get all tags - across all jobs - for the resume'
      tags 'Resume'

      response 200, 'queried using a valid resume id' do
        produces 'application/json'
        let (:id) { 1 }

        schema type: 'array', items: {
          '$ref' => '#/components/schemas/tag'
        }

        run_test!
      end

      response 404, 'queried using an invalid resume id', &not_found_proc
    end
  end

  path '/api/v1/resume/{id}/tags/{tags}/jobs' do
    parameter name: 'id', in: :path, required: true, type: :integer, description: 'id of the desired resume'
    parameter name: 'tags', in: :path, required: true, description: 'array of tag ids to fillter by', schema:
      { 
        type: 'array',
        items: {
          type: 'integer'
        }
      }
    
      get('jobs') do
        description 'Get job details for the resume'
        tags 'Resume'

        response 200, 'queried using a valid resume id and list of tags' do
          produces 'application/json'
          let(:id) { 1 }
          let(:tags) { '29,11' }

          schema '$ref' => '#/components/schemas/resume' 

          run_test!
        end

        response 404, 'queried using an invalid resume id and valid tags' do
          let(:id) { 999 }
          let(:tags) { '29,11' }

          run_test!
        end
        
        response 404, 'queried using a valid resume id but invalid tags' do
          let(:id) { 1 }
          let(:tags) { '290,110' }

          run_test!
        end
      end
  end
end
