class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.belongs_to :inviter
      t.belongs_to :invitee
      t.belongs_to :event

      t.timestamps
    end
  end
end
