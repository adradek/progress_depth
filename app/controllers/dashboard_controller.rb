class DashboardController < ApplicationController
  def index
    # Today's
    @today = Day.find_by(day: Time.zone.today) || Day.create(day: Time.zone.today)
    @activities = @today.activities.order(:id)
    @total_balance = 100 + Day.all.sum(:balance)

    # Last days
    @decade = Day.order(day: :desc).limit(10)
  end
end
