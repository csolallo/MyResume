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
              type: 'string',
              example: 'Joe User'
            },
            address1: {
              type: 'string',
              example: '123 Main St.'
            },
            address2: {
              type: 'string',
              example: 'Apt. B'
            },
            city: {
              type: 'string',
              example: 'Seattle'
            },
            state: {
              type: 'string',
              example: 'WA'
            },
            zip: {
              type: 'string',
              example: '12345'
            },
            number: {
              type: 'string',
              example: '206-555-1212'
            },
            email: {
              type: 'string',
              example: 'user@company.com'
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
              type: 'string',
              example: 'University of Washington'
            },
            title: {
              type: 'string',
              example: 'B.S. Computer Science'
            },
            gpa: {
              type: 'string',
              example: '3.0'
            },
            year: {
              type: 'integer',
              example: 1990
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
          type: 'string',
          example: 'Over a decade of engineering leadership'
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
              type: 'integer',
              example: 1
            }
          }

        run_test!
      end

      response 404, 'queried using an invalid person id', &not_found_proc
    end
  end

end
