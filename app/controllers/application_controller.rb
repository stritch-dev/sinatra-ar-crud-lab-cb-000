
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ####### create ###### 
  get '/posts/new' do
    erb :new
  end

  post '/posts' do 
    @post = Post.create(params)
    redirect to '/posts'
  end

  ####### read ###### 
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  ####### update ###### 
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  ####### delete ###### 
  get '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :index
    
  end
end
