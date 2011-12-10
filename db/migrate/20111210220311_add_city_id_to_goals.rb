class AddCityIdToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :city_id, :integer
  end
end
