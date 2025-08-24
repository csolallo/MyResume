# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'MyResume API',
        version: 'v1'
      },
      paths: {},
      components: {
        schemas: {
          tag: {
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
          },
          company: {
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
          },
          job: {
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
                        '$ref' => '#/components/schemas/tag'
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      servers: [
        {
          url: 'https://resume.sola-llon.ch',
          description: 'Production environment'
        }, 
        {
          url: 'https://localhost:3001',
          description: 'Testing environment. Internal use only'
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
