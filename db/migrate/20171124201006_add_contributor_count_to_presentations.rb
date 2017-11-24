class AddContributorCountToPresentations < ActiveRecord::Migration[5.0]
  def change
    add_column :presentations, :contributors_count, :integer
  end
end
