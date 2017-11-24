class ChangeNameDefaultValueInContributors < ActiveRecord::Migration[5.0]
  def change
    change_column_default :contributors, :name, 'id'
  end
end
