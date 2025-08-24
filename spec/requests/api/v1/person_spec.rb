require 'swagger_helper'


# what even is run_tests!         
# * call our api and validate response against schema
# * generates documentation

RSpec.describe 'person endpoints', type: :request do

  # uuid in test environment. Update if we reseed test
  Me = '6fd2bf66-24c8-4aa1-9ae2-cb81e9a7f483'

  not_found_proc = Proc.new {
    let(:uuid) { 'bad-person-uuid' }
    run_test!
  }

  path '/api/v1/person/{uuid}/info' do
    parameter name: 'uuid', in: :path, type: :string, required: :true, description: 'id of the person being queried'
    
    get 'info' do
      description 'Get contact information for person'
      tags 'Person'
      
      response(200, 'queried using a valid person id') do
        produces 'application/json'
        let('uuid') { Me }
        
        schema type: 'object', 
          required: %w(name),
          properties: {
            name: {
              type: 'string'
            },
            address1: {
              type: 'string'
            },
            address2: {
              type: 'string'
            },
            city: {
              type: 'string'
            },
            state: {
              type: 'string'
            },
            zip: {
              type: 'string'
            },
            number: {
              type: 'string'
            },
            email: {
              type: 'string'
          }
        }
        
        run_test! do |response|
          data = JSON.parse response.body
          expect(data['name']).to eq('Carlos Sola-Llonch')
        end
      end

      response 404, 'queried using an invalid person id', &not_found_proc
    end
  end

  path '/api/v1/person/{uuid}/education' do
    parameter name: 'uuid', in: :path, type: :string, required: :true, description: 'id of the person being queried'

    get 'education' do
      description 'Get education history and certificates for person'
      tags 'Person'
      
      response(200, 'queried using a valid person id') do
        produces 'application/json'
        let('uuid') { Me }

        schema type: 'array', items: {
          type: 'object', 
          required: %w(origin title),
          properties: {
            origin: {
              type: 'string'
            },
            title: {
              type: 'string'
            },
            gpa: {
              type: 'string'\
            },
            year: {
              type: 'integer'
            }
          }
        }

        run_test!
      end

      response 404, 'queried using an invalid person id', &not_found_proc
    end
  end

  path '/api/v1/person/{uuid}/highlights' do
    parameter name: :uuid, in: :path, type: :string, required: true, description: 'id of the person being queried'

    get 'career highlights' do
      description 'Bulleted list of career highlights for person'
      tags 'Person'
    
      response 200, 'queried with a valid person id' do
        produces 'application/json'
        let (:uuid) { Me }

        schema type: 'array', items: 
        {
          type: 'string'
        }

        run_test!
      end

      response 404, 'queried using invalid person id', &not_found_proc
    end

  end

  path '/api/v1/person/{uuid}/resume' do
    parameter name: :uuid, in: :path, type: :string, required: true, description: 'id of the person being queried'

    get 'resume id' do
      description 'get the id of the resume associated with person'
      tags 'Person'

      response 200, 'queried with valid person id' do
        produces 'application/json'
        let (:uuid) { Me }

        schema type: 'object',
          required: %w(resume),
          properties: {
            resume: {
              type: 'integer'
            }
          }

        run_test!
      end

      response 404, 'queried using an invalid person id', &not_found_proc
    end
  end

end
