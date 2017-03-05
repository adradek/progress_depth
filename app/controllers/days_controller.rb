class DaysController < ApplicationController
  def index
    @days = Day.all.order(day: :desc).limit(25)
  end

  def show
    @day = Day.find(params[:id])
    @new_activity = @day.activities.build
    @activities = @day.activities.order(:id)
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to days_url
    else
      render :new
    end
  end

  def destroy
    Day.find(params[:id]).destroy
    redirect_to days_url
  end

  private

  def day_params
    params.require(:day).permit(:day, :balance)
  end
end
