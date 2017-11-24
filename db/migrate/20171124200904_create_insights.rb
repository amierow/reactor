class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|
      t.integer :presentation_id
      t.integer :contributor_id
      t.integer :insght_type_id
      t.string :title
      t.string :body
      t.string :answered

      t.timestamps

    end
  end
end
