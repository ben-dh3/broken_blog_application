require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should get the form' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/check" method="POST">')
      expect(response.body).to include('<input type="text" name="postcode" />')
    end
  end

  context 'POST /check' do
    it 'should get valid postcode result' do
      response = post('/check', postcode: 'EC1A 1BB')

      expect(response.status).to eq(200)
      expect(response.body).to include('This is a valid postcode')
    end

    it 'should get invalid postcode result' do
      response = post('/check', postcode: '37737 1BB')

      expect(response.status).to eq(200)
      expect(response.body).to include('This is not a valid postcode')
    end

    it 'should have a link to go back to the homepage' do
      response = post('/check', postcode: 'EC1A 1BB')

      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/">Back to the homepage</a>')
    end
  end
end