class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index action
  get '/recipes' do
    #binding.pry
    @recipes = Recipe.all
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
  get '/recipes/:id/edit' do #edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch 'recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #delete action

  delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipe'
end


end
