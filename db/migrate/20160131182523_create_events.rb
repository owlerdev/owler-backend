class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :address
      t.text :description

      # times
      t.datetime :start
      t.datetime :end

      t.boolean :posted
      t.string :update_code

      t.timestamps null: false
    end
  end
end
