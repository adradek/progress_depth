class ActivitiesController < ApplicationController
  def create
    @day = Day.find(params[:day_id])
    @new_activity = @day.activities.build(activity_params)

    if @new_activity.save
      redirect_to @day
    else
      @activities = @day.activities
      render template: 'days/show'
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to day_url(activity.day_id)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :value)
  end
end
