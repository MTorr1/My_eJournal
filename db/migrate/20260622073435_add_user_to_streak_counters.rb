class AddUserToStreakCounters < ActiveRecord::Migration[8.1]
  def change
    add_reference :streak_counters, :user, null: false, foreign_key: true
  end
end
