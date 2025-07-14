class CreateEventUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :event_users do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
