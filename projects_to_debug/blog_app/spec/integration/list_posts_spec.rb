
require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # setup
  before do
    create_test_post_with_tags('Test cooking post', ['cooking'])
    create_test_post_with_tags('Test programming post', ['programming'])
  end

  context 'GET /' do
    it 'shows the list of posts' do
      response = get('/')

      expect(response.body).to include('Test programming post')
      expect(response.body).to include('Test cooking post')
    end
  end

  context 'GET /tag/:tag' do
    it 'displays the posts tagged with cooking' do
      response = get('/tag/cooking')

      expect(response.body).to include('Test cooking post')
      expect(response.body).to_not include('Test programming post')
    end
  end

  def create_test_post_with_tags(title, tags)
    PostManager.instance.add_post(
      Post.new(title, "I'm just a test post. Nothing much to say really.", tags)
    )
  end
end
