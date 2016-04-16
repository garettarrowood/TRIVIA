class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.text :bio
      t.string :pic
      t.timestamps null: false
    end
  end
end
