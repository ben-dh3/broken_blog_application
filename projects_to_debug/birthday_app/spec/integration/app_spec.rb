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
      expect(response.body).to include('form')
      expect(response.body).to include('<input type="date" name="birthday" required pattern="\d{2}-\d{2}">')
    end
  end

  context 'POST /greet' do
    it 'should wish happy birthday' do
      today_param = Date.today.strftime('%m-%d')
      response = post('/greet', birthday: today_param)

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Happy birthday!</h1>')
    end

    it 'should indicate 7 days until birthday' do
      today_param = (Date.today + 7).strftime('%m-%d')
      response = post('/greet', birthday: today_param)

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Your birthday is in 7 days!</h1>')
    end
  end
end