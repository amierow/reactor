class AddInsightCountToInsightTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :insight_types, :insights_count, :integer
  end
end
