class DashboardController < ApplicationController
  def index
    # Today's
    @today = Day.find_by(day: Date.today) || Day.create(day: Date.today)
    @activities = @today.activities
    @total_balance = 100 + Day.all.sum(:balance)

    # Last days
    @decade = Day.order(day: :desc).limit(10)
  end
end
