class ChangeBodyDefaultValueInInsights < ActiveRecord::Migration[5.0]
  def change
    change_column_default :insights, :body, 'Type Body Here (optional)'
  end
end
