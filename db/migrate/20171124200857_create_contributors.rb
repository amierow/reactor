class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :presentation_id
      t.string :name
      t.string :email
      t.string :position
      t.string :department
      t.string :facility

      t.timestamps

    end
  end
end
