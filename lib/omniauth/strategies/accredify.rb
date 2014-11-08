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
          redirect client.auth_code.authorize_url({:redirect_uri => redirect_uri}.merge(authorize_params))
      end

      def redirect_uri
        options.redirect_uri ||= request.params["redirect_uri"] || nil rescue nil
      end
      

      info do
        {         
          'legal_name' => raw_info['legal_name'],
          'primary_address' => raw_info['primary_address'],
          'email' => raw_info['email'],
          'basis' => raw_info['basis'],
          'is_federally_accredited' => raw_info['is_federally_accredited'],
          'certificate_url' => raw_info['certificate_url'],
          'created_on' => raw_info['created_on'],
          'expires_on' => raw_info['expires_on'],
          'year1' => raw_info['year1'],
          'year2' => raw_info['year2'],
          'income_level_year1' => raw_info['income_level_year1'],
          'income_level_year2' => raw_info['income_level_year2'],
          'asset_level' => raw_info['asset_level'],
          'verified_state_of_residence' => raw_info['verified_state_of_residence'],
          'letter_link' => raw_info['letter_link'],
          'verifier_link' => raw_info['verifier_link'],
          'facebook_profile' => raw_info['facebook_profile'],
          'twitter_profile' => raw_info['twitter_profile'],
          'linkedin_profile' => raw_info['linkedin_profile'],
          'google_plus_profile' => raw_info['google_plus_profile'],
        }
      end

      def raw_info
          @raw_info ||= access_token.get('https://api.accredify.com/api/v1/me.json').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'accredify', 'Accredify'
