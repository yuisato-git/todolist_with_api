module V1
  class Root < Grape::API
    version 'v1'
    format :json
    content_type :json, 'application/json'

    mount V1::Resources::TodoItems
    mount V1::Resources::TodoComments

    # swaggerの設定
    if defined? GrapeSwaggerRails
      add_swagger_documentation(
          api_version: 'v1',
          base_path: '/api',
          hide_documentation_path: true,
      )
    end
  end
end
