class ChangeInsightTypeDefaultValueInInsightTypes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :insight_types, :insight_type, 'Question'
  end
end
