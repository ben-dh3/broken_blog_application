require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  describe 'Creating a new post' do
    context 'GET /' do
      it 'should get the form to add a new post' do
        response = get('/')

        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="post" action="/posts">')
        expect(response.body).to include('<input type="text" name="title" />')
        expect(response.body).to include('<input type="text" name="content" />')
        expect(response.body).to include('<input type="text" name="tags" />')
      end
    end

    context 'POST /' do
      it 'should add the new post' do
        _response = post(
          '/posts',
          title: 'A new post',
          content: 'Hi there',
          tags: 'random,things'
        )

        response = get('/')

        expect(response.body).to include('<h3>A new post</h3>')
      end
    end
  end
end