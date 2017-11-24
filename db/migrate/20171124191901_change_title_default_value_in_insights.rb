class ChangeTitleDefaultValueInInsights < ActiveRecord::Migration[5.0]
  def change
    change_column_default :insights, :title, 'Type Title'
  end
end
