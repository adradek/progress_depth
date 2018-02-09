class ChartsController < ApplicationController
  def overall_progress
    data = [["Day", "Score"]]
    render json: data.concat(day_data)
  end

  def last
    data = [["Day", "Score"]]
    render json: data.concat(day_data(from: params[:days].to_i.days.ago))
  end

  private

  def day_data(from: nil)
    sum = 100
    result = []
    days = from ? Day.where('day > ?', from).order(:day) : Day.order(:day)
    days.each { |day| result << [day.day.to_s, sum += day.balance] }
    result
  end
end
