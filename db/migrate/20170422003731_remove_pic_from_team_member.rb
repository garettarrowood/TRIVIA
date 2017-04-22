class RemovePicFromTeamMember < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_members, :pic, :string
  end
end
