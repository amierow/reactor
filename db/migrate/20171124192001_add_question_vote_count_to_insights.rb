class AddQuestionVoteCountToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :question_votes_count, :integer
  end
end
