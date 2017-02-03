class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)

    if @day.save
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    Day.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def day_params
    params.require(:day).permit(:day, :balance)
  end
end
