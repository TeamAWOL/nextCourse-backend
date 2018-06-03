class AddGroupToOutings < ActiveRecord::Migration[5.2]
  def change
    add_reference :outings, :user, foreign_key: true
  end
end
