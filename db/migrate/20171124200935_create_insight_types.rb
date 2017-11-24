class CreateInsightTypes < ActiveRecord::Migration
  def change
    create_table :insight_types do |t|
      t.string :insight_type

      t.timestamps

    end
  end
end
