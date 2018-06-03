class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.string :name
      t.string :winner
      t.string :winning_restaurant
      t.string :winning_group
      t.datetime :winning_time

      t.timestamps
    end
  end
end
