class AddContestIdToRestult < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :contest_id, :integer
  end
end
