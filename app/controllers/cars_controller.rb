class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :color, :license_plate)
  end
end
