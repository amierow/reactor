class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :insight_id
      t.integer :contributor_id
      t.integer :rating_type_id
      t.string :rating
      t.string :feedback

      t.timestamps

    end
  end
end
