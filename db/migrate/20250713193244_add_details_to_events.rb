class AddDetailsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :title, :string
    add_column :events, :details, :text
  end
end
