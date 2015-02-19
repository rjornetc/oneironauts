class CreateSleepLogs < ActiveRecord::Migration
  def change
    create_table :sleep_logs do |t|
      t.integer :user_id
      t.time :start_time
      t.time :end_time
      t.date :date

      t.timestamps null: false
    end
  end
end
