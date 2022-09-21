require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    get '/posts/show'
  end

  describe 'GET /posts/show' do
    it 'returns http to be successful' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'page content is from app/views/posts/show.html.erb' do
      expect(response.body).to_not include('app/views/posts/show.html.erb')
    end

    it 'response status is 200' do
      expect(response.status).to eq(200)
    end
    it 'create a new page' do
      expect(response).to have_http_status(:ok)
    end

    it 'content of the page is "individual content"' do
      expect(response.body).to include('individual content')
    end

    it 'displays posts/show' do
      expect(response).to render_template('posts/show')
    end

    it 'page content is not from app/views/posts/users.html.erb' do
      expect(response.body).not_to include('app/views/posts/users.html.erb')
    end

    it 'content of the page is not "We are here"' do
      expect(response.body).not_to include('We are here')
    end

    it 'does not display users/show' do
      expect(response).not_to render_template('users/show')
    end
  end

  describe 'GET /users/1/posts' do
    before(:each) do
      get '/users/1/posts'
    end
    it 'returns http to be successful' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'content of the page is not "All content posted"' do
      expect(response.body).to include('All content posted')
    end

    it 'response status is 200' do
      expect(response.status).to eq(200)
    end
    it 'create a new page' do
      expect(response).to have_http_status(:ok)
    end
  end
end
