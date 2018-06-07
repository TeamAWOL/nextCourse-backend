class ModifingOutingsAddUrl < ActiveRecord::Migration[5.2]
  def change
     remove_column :outings, :name
     add_column :outings, :url, :string
  end
end
