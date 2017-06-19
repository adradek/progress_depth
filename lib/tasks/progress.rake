namespace :progress do
  desc "TODO"
  task fine_day: :environment do
    today = Day.find_or_create_by(day: Time.zone.today)

    # Don't assign a fine on weekend or if fine is already assigned
    unless today.free? || today.activities.any? { |a| a.title == "Day fine" }
      today.activities.create(title: "Day fine", value: -10)
    end
  end
end
