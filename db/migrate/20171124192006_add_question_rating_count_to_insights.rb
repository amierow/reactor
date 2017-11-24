class AddQuestionRatingCountToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :question_ratings_count, :integer
  end
end
