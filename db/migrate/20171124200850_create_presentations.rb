class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.integer :lead_id
      t.string :date
      t.string :name

      t.timestamps

    end
  end
end
