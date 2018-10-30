class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index action
  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

#new action
  get '/recipes/new' do

    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "recipes/#{@recipe.id}"
  end

#show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

#edit action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch 'recipes/:id' do

  end

end
