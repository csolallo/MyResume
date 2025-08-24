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
              type: 'array', items:
              {
                type: 'object', 
                required: %w(id name address1 address2 city state zip),
                properties: {
                  id: {
                    type: 'integer'
                  },
                  name: {
                    type: 'string'
                  },
                  address1: {
                    type: 'string',
                    nullable: true
                  },
                  address2: {
                    type: 'string',
                    nullable: true
                  },
                  city: {
                    type: 'string',
                    nullable: true
                  },
                  state: {
                    type: 'string',
                    nullable: true
                  },
                  zip: {
                    type: 'string',
                    nullable: true
                  }
                }
              }
            },
            jobs: {
              type: 'array', items:
              {
                type: 'object',
                required: %w(title start_date end_date company_id projects),
                properties: {
                  title: {
                    type: 'string'
                  },
                  start_date: {
                    type: 'string',
                    format: 'date-time'
                  },
                  end_date: {
                    type: 'string',
                    format: 'date-time',
                    nullable: true
                  },
                  company_id: {
                    type: 'integer'
                  },
                  projects: {
                    type: 'array', items: 
                    {
                      type: 'object',
                      required: %w(name description accomplishments tags),
                      properties: {
                        name: {
                          type: 'string'
                        },
                        description: {
                          type: 'string'
                        },
                        accomplishments: {
                          type: 'array', items: 
                          {
                            type: 'object',
                            required: %w(description),
                            properties: {
                              description: {
                                type: 'string'
                              }
                            }
                          }
                        },
                        apps: {
                          type: 'array', items: 
                          {
                            type: 'object',
                            required: %w(name platform url comment image_url),
                            properties: {
                              name: {
                                type: 'string'
                              },
                              platform: {
                                type: 'string'
                              },
                              url: {
                                type: 'string',
                                nullable: true
                              },
                              commment: {
                                type: 'string',
                                nullable: true
                              },
                              image_url: {
                                type: 'string',
                                nullable: true
                              }
                            }
                          }
                        },
                        tags: {
                          type: 'array', items: 
                          {
                            type: 'object',
                            required: %w(id name),
                            properties: {
                              id: {
                                type: 'integer'
                              },
                              name: {
                                type: 'string'
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
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
