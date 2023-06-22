class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end
  
  def create
    toy = Toy.find_or_create_by(toy_params)
    toy.likes += 1
    toy.save
    render json: toy, status: :created
  end  

  def update
    toy = Toy.find_by(id: params[:id])
    toy.likes += 1
    if toy.update(toy_params)
      render json: toy
    else
      render json: { error: toy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end
end
