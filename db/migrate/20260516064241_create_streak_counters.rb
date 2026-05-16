class CreateStreakCounters < ActiveRecord::Migration[8.1]
  def change
    create_table :streak_counters do |t|
      t.timestamps
    end
  end
end
