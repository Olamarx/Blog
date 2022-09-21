require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    get '/users'
  end

  describe 'GET /users/show' do
    it 'returns http to be successful' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'page content is from app/views/users/show.html.erb' do
      expect(response.body).to_not include('app/views/users/show.html.erb')
    end

    it 'response status is 200' do
      expect(response.status).to eq(200)
    end
    it 'create a new page' do
      expect(response).to have_http_status(:ok)
    end

    it 'content of the page is "All users"' do
      expect(response.body).to include('All users')
    end

    it 'displays users' do
      expect(response).to render_template('users/index')
    end

    it 'page content is not from app/views/users/posts.html.erb' do
      expect(response.body).not_to include('app/views/users/posts.html.erb')
    end

    it 'content of the page is not "We are here"' do
      expect(response.body).not_to include('We are here')
    end

    it 'does not display posts/show' do
      expect(response).not_to render_template('posts/show')
    end
  end

  describe 'GET /users/index' do
    before(:each) do
      get '/users/index'
    end
    it 'returns http to be successful' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'response status is 200' do
      expect(response.status).to eq(200)
    end
    it 'create a new page' do
      expect(response).to have_http_status(:ok)
    end
  end
end
