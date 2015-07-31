class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :x_coordinate
      t.integer :y_coordinate

      t.timestamps null: false
    end
  end
end
