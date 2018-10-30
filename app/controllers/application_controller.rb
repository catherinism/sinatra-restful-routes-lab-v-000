class ApplicationController < Sinatra::Base
    set :views, Proc.new { File.join(root, "../views/") }
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #new action
    get '/recipes/new' do
      erb :new
    end

#index action
  get '/recipes' do
    #binding.pry
    @recipes = Recipe.all
    erb :index
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
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.name = params[:name]
     @recipe.ingredients = params[:ingredients]
     @recipe.cook_time = params[:cook_time]
     @recipe.save
     redirect to "/recipes/#{@recipe.id}"
   end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "recipes/#{@recipe.id}"
  end

  #delete action

  delete '/recipes/:id/delete' do
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipe'
end

end
