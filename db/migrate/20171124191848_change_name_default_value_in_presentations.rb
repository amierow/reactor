class ChangeNameDefaultValueInPresentations < ActiveRecord::Migration[5.0]
  def change
    change_column_default :presentations, :name, 'id'
  end
end
