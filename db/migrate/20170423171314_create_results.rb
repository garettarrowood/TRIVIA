class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :year
      t.integer :place
      t.integer :points
      t.string :team_name

      t.timestamps
    end
  end
end
