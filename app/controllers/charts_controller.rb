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
    if from
      sum = 100 + Day.where('day <= ?', from).sum(:balance)
      days = Day.where('day > ?', from).order(:day)
    else
      sum = 100
      days = Day.order(:day)
    end

    result = []
    days.each { |day| result << [day.day.to_s, sum += day.balance] }
    result
  end
end
