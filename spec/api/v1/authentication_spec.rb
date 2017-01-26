require 'rails_helper'
require 'net/http'
require 'uri'
require 'json'
require 'pry'
require 'awesome_print'


# curl -H "Content-Type: application/json" -X POST  -d '{"email":"test@mail.com","password":"right_password"}' http://localhost:3000/api/v1/authentication/sign_in
describe 'Authentication service create a JSON Web Token' do
  it 'should return a valid token if the authentication is correct' do
    post '/api/v1/authentication/sign_in',
      params: {email: 'test@email.com', password: 'right_password'}.to_json,
      headers:{ 'CONTENT_TYPE' => 'application/json',
                'ACCEPT' => 'application/json' }

    expect(response).to be_success
    expect(JSON.parse(response.body).keys.first).to eq("auth_token")
  end

  it 'should return an error message if the authentication is incorrect' do
     post '/api/v1/authentication/sign_in',
       params: {email: 'test@mail.com', password: 'wrong_password'}.to_json,
       headers:{ 'CONTENT_TYPE' => 'application/json',
                 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(401)
    expect(JSON.parse(response.body).keys.first).to eq("error")
  end
end

