class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :insight_id
      t.integer :contributor_id
      t.string :vote

      t.timestamps

    end
  end
end
