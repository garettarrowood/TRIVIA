class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.integer :number
      t.integer :points
      t.integer :contest_id

      t.timestamps
    end
  end
end
