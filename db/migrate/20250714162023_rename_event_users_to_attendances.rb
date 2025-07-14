class RenameEventUsersToAttendances < ActiveRecord::Migration[8.0]
  def change
    rename_table :event_users, :attendances
  end
end
