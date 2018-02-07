class ChartsController < ApplicationController
  def overall_progress
    sum = 100
    data =  Day.order(:day).map { |day| [day.day.to_s, sum += day.balance] }
    render json: data
  end
end
