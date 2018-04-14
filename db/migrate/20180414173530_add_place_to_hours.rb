class AddPlaceToHours < ActiveRecord::Migration[5.2]
  def change
    add_column :hours, :place, :integer
  end
end
