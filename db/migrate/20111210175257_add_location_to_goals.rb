class AddLocationToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :location, :string
  end
end
