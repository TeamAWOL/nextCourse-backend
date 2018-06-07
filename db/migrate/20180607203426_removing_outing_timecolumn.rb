class RemovingOutingTimecolumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :outings, :winning_time 
  end
end
