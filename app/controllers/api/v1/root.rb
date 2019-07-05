module API
  module V1
    class Root < Grape::API
      version 'v1'
      helpers API::Helpers::RenderHelper
      include API::Concern::Urls

      add_swagger_documentation(
        base_path:               '/api',
        hide_documentation_path: true,
        api_version:             'v1',
        info:                    { title: 'API' }
      )
    end
  end
end
