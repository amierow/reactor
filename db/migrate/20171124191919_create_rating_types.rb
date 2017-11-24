class CreateRatingTypes < ActiveRecord::Migration
  def change
    create_table :rating_types do |t|
      t.string :rating_type

      t.timestamps

    end
  end
end
