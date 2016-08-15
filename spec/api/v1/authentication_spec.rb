require 'rails_helper'
require 'net/http'
require 'uri'
require 'json'
require 'pry'
require 'awesome_print'


# curl -H "Content-Type: application/json" -X POST 
# -d '{"email":"example@mail.com","password":"123123123"}' 
# http://localhost:80/api/v1/authentication/sign_in
describe 'Authentication service create a JSON Web Token' do 
  it 'should return a valid token if the authentication is correct' do 
    post '/api/v1/authentication/sign_in',
      params: {email: 'example@mail.com', password: '123123123'}.to_json,
      headers:{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to be_success
    expect(JSON.parse(response.body).keys.first).to eq("auth_token")
  end

  it 'should return an error message if the authentication is incorrect' do
     post '/api/v1/authentication/sign_in',
       params: {email: 'example@mail.com', password: '123123124'}.to_json,
       headers:{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(401)
    expect(JSON.parse(response.body).keys.first).to eq("error")
  end
end

