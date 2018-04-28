require 'httparty'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    response = self.class.post( '/sessions',
      body: { "email": email,
              "password": password
            })
    if response.code != 200
      raise 'invalid email or password'
    end

    @auth = response['auth_token']
  end

end
