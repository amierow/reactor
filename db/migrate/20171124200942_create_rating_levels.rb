class CreateRatingLevels < ActiveRecord::Migration
  def change
    create_table :rating_levels do |t|
      t.string :rating_level
      t.string :order_number
      t.string :score
      t.integer :rating_type_id

      t.timestamps

    end
  end
end
