class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :event_date

      t.timestamps
    end
  end
end
