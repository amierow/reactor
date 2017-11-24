class AddQuestionRatingCountToContributors < ActiveRecord::Migration[5.0]
  def change
    add_column :contributors, :question_ratings_count, :integer
  end
end
