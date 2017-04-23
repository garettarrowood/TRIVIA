class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :theme
      t.integer :year
      t.integer :number

      t.timestamps
    end
  end
end
