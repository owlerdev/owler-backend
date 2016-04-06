class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :kind

      t.timestamps null: false
    end
  end
end
