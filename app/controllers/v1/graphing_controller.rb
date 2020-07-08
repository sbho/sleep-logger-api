class V1::GraphingController < ApplicationController
  # Returns the summarized data for graphing in JSON format.
  def graphing
    # Get morning entries whose morning feeling matches that of the request's parameter.
    @filtered_morning_entries = []
    @filtered_morning_entries = @current_user.morning_entries
                                    .where(morning_feeling: params[:morning_feeling])

    @filtered_evening_entries = []

    @filtered_morning_entries.each do |m|
      date = m.updated_at.to_date.prev_day
      e = @current_user.evening_entries.where(updated_at: date.beginning_of_day...date.end_of_day)
      @filtered_evening_entries.concat(e)
    end

    render json: {hours: hours_stats,
                  caffeine_morning: caffeine_morning_stats,
                  caffeine_afternoon: caffeine_afternoon_stats,
                  caffeine_evening: caffeine_evening_stats,
                  nap_morning: nap_morning_stats,
                  nap_afternoon: nap_afternoon_stats,
                  nap_evening: nap_evening_stats
    }, status: :ok
  end

  private

  # For each type of stat, count entries with certain attributes by using a hash table whose key is the
  # attribute and value is its count.

  def hours_stats
    map = {}
    @filtered_morning_entries.each do |m|
      hours = m.hours_of_sleep
      if map.key?(hours)
        map[hours] += 1
      else
        map[m.hours_of_sleep] = 1
      end
    end
    formatted = []
    map.each do |key, value|
      formatted << {hours: key, count: value}
    end
    return formatted
  end

  def caffeine_morning_stats
    map = {}
    @filtered_evening_entries.each do |m|
      caffeine_morning = m.caffeine_morning
      if map.key?(caffeine_morning)
        map[caffeine_morning] += 1
      else
        map[m.caffeine_morning] = 1
      end
    end

    formatted = []
    map.each do |key, value|
      formatted << {caffeine_morning: key, count: value}
    end
    return formatted
  end

  def caffeine_afternoon_stats
    map = {}
    @filtered_evening_entries.each do |m|
      caffeine_afternoon = m.caffeine_afternoon
      if map.key?(caffeine_afternoon)
        map[caffeine_afternoon] += 1
      else
        map[m.caffeine_afternoon] = 1
      end
    end

    formatted = []
    map.each do |key, value|
      formatted << {caffeine_afternoon: key, count: value}
    end
    return formatted
  end

  def caffeine_evening_stats
    map = {}
    @filtered_evening_entries.each do |m|
      caffeine_evening = m.caffeine_evening
      if map.key?(caffeine_evening)
        map[caffeine_evening] += 1
      else
        map[m.caffeine_evening] = 1
      end
    end
    formatted = []
    map.each do |key, value|
      formatted << {caffeine_evening: key, count: value}
    end
    return formatted
  end

  def nap_morning_stats
    map = {}
    @filtered_evening_entries.each do |m|
      nap_morning = m.nap_morning
      if map.key?(nap_morning)
        map[nap_morning] += 1
      else
        map[m.nap_morning] = 1
      end
    end
    formatted = []
    map.each do |key, value|
      formatted << {nap_morning: key, count: value}
    end
    return formatted
  end

  def nap_afternoon_stats
    map = {}
    @filtered_evening_entries.each do |m|
      nap_afternoon = m.nap_afternoon
      if map.key?(nap_afternoon)
        map[nap_afternoon] += 1
      else
        map[m.nap_afternoon] = 1
      end
    end
    formatted = []
    map.each do |key, value|
      formatted << {nap_afternoon: key, count: value}
    end
    return formatted
  end

  def nap_evening_stats
    map = {}
    @filtered_evening_entries.each do |m|
      nap_evening = m.nap_evening
      if map.key?(nap_evening)
        map[nap_evening] += 1
      else
        map[m.nap_evening] = 1
      end
    end
    formatted = []
    map.each do |key, value|
      formatted << {nap_evening: key, count: value}
    end
    return formatted
  end
end
