class CreateTeamMemberPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :team_member_photos do |t|
      t.string :url
      t.integer :year
      t.integer :team_member_id

      t.timestamps
    end
  end
end
