class AddQuestionRatingCountToRatingTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :rating_types, :question_ratings_count, :integer
  end
end
