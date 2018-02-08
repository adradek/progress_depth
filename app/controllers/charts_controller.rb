class ChartsController < ApplicationController
  def overall_progress
    sum = 100
    data = [["Day", "Score"]]
    Day.order(:day).each { |day| data << [day.day.to_s, sum += day.balance] }
    render json: data
  end
end
