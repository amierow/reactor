class ChangeRatingTypeDefaultValueInRatingTypes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :rating_types, :rating_type, 'Letter Grade'
  end
end
