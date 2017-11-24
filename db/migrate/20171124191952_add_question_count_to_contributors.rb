class AddQuestionCountToContributors < ActiveRecord::Migration[5.0]
  def change
    add_column :contributors, :questions_count, :integer
  end
end
