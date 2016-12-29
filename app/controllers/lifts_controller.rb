class LiftsController < ApplicationController
  before_action :set_lift, only: [:update, :destroy]

  def index
    @lifts = Lift.all
  end

  def create
    @lift = Lift.new(lift_params)

    if @lift.save
      render json: @lift
    else
      render json: @lift.errors, status: :unprocessable_entity
    end
  end

  def update
    if @lift.update(lift_params)
      render json: @lift
    else
      render json: @lift.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lift.destroy
    head :no_content
  end

  private

  def set_lift
    @lift = Lift.find(params[:id])
  end

  def lift_params
    params.require(:lift).permit(:date, :liftname, :ismetric, :weightlifted, :repsperformed, :onerm)
  end
end
