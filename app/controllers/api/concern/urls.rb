module API
  module Concern::Urls
    extend ActiveSupport::Concern
    included do
      namespace :url do
        desc 'Create short url',
             failure: [{ code: 422, message: 'Unprocessable Entity Error' }]

        params do
          requires :original, type: String, desc: 'Original url'
          requires :short,    type: String, desc: 'Short url'
        end

        post '/create' do
          url = Url.new(params)
          url.save ? success! : error_422!(url.errors.messages)
        end
      end
    end
  end
end
