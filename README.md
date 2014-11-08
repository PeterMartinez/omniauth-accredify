# OmniAuth Accredify &nbsp;

**These notes are based on master, please see tags for README pertaining to specific releases.**

Accredify OAuth2 Strategy for OmniAuth.

Supports the OAuth 2.0 server-side and client-side flows. 

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-accredify'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Accredify` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :accredify, ENV['ACCREDIFY_APP_ID'], ENV['ACCREDIFY_SECRET'], :redirect_uri=>ENV['ACCREDIFY_CALLBACK']
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'accredify',
  :info => {
     :legal_name => 'John Doe',
     :primary_address => '123 Mayberry Lane',
     :email => 'Jhon@Doe.com',
     :basis => 'asset',
     :is_federally_accredited => 'true'
     :certificate_url => 'https://api.accredify.com/certificates/9e5d467c8a61cac3b8698a6b76ba6ed4',
     :created_on => '2014-08-26T14:05:03.009Z',
     :expires_on => '2014-08-26T14:05:03.009Z',
     :year1 => '',
     :year2 => '',
     :income_level_year1 => '',
     :income_level_year2 => '',
     :asset_level => '1B+',
     :verified_state_of_residence => 'Florida',
     :letter_link => '',
     :verifier_link => '',
     :facebook_profile => 'https://www.Facebook.com/JohnDoe',
     :twitter_profile => 'http://www.twitter.com/JohnDoe',
     :linkedin_profile => 'https://www.linkedin.com/JohnDoe',
     :google_plus_profile => 'https://plus.google.com/+JohnDoe',
  },
  :credentials => {
    :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    :expires_at => 1321747205, # when the access token expires (it always will)
    :expires => true # this will always be true
  } 
}
```