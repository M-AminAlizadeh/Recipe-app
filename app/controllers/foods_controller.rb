class FoodsController < ApplicationController
  # before_action :set_food, only: [:update, :destroy]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :unit_price)
  end
end