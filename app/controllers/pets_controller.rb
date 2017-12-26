class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners=Owner.all
    binding.pry
    erb :'/pets/new'
  end

  post '/pets' do
    binding.pry
    #puts params
    @pet=Pet.create(params[:pet])
    @pet.owner=Owner.find(:owner)
    @pet.owner=Owner.create(name: params["owner_name"]) if !params["owner_name"].empty?
    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
