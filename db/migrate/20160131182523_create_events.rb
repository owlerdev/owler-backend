class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :address

      # latitude and longitude
      t.float :lat
      t.float :lng

      t.text :description

      t.integer :user_id

      # times
      t.datetime :start_t
      t.datetime :end_t

      t.boolean :posted, default: false

      t.timestamps null: false
    end
  end
end
