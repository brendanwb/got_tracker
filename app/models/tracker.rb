class Tracker
  attr_accessor :episodes, :new_episodes_start_date

  def initialize(options = {})
    @episodes = options[:episodes]
    @new_episodes_start_date = options[:new_episodes_start_date]
  end

  def done?
    unwatched_episodes.empty?
  end

  def total_episodes
    @episodes.count
  end

  def remaining_episodes
    unwatched_episodes.count
  end

  def unwatched_episodes
    @episodes.reject(&:watched?)
  end

  def percent_remaining
    (remaining_episodes.to_f / total_episodes) * 100
  end

  def days_before_new_episodes
    ((new_episodes_start_date - Date.current).abs).round
  end

  def weeks_left
    (days_before_new_episodes / 7.0).round
  end

  def episodes_per_week
    remaining_episodes / weeks_left
  end

  def on_schedule?
    return false if (days_before_new_episodes/1.0).nan?
    remaining_episodes <=  days_before_new_episodes
  end
end
