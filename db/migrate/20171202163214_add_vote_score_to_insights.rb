class AddVoteScoreToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :vote_score, :integer
  end
end
