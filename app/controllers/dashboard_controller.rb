class DashboardController < ApplicationController
  def index
    # Today's
    @today = Day.find_by(day: Time.zone.today) || Day.create(day: Time.zone.today)
    @activities = @today.activities.order(:id)
    @total_balance = 100 + Day.all.sum(:balance)

    # Last days
    @decade = Day.order(day: :desc).limit(10)
  end

  def search
    query       = "%" << params[:searchline].mb_chars.downcase.to_s << "%"
    @activities = Activity.where('lower(title) like :q OR lower(description) like :q', q: query)
                          .includes(:day).order(:day_id, :id)
  end
end
