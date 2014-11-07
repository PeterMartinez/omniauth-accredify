require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Accredify < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.accredify.com',
        :authorize_url => 'https://api.accredify.com/oauth/authorize',
        :token_url => 'https://api.accredify.com/oauth/token'
      }

      def request_phase
        super
      end

      uid { user_data['id'] }

      info do
        {
          'email' => user_data['email'],
        }
      end

      def user_data
        access_token.options[:mode] = :query
        user_data ||= access_token.get('/api/v1/me.json').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'accredify', 'Accredify'
