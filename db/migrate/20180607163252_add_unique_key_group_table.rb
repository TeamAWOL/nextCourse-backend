class AddUniqueKeyGroupTable < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_index :groups, [ :name]
      add_index :groups, [:name], unique: true
    end
  end
end
