class ChangeFeedbackDefaultValueInRatings < ActiveRecord::Migration[5.0]
  def change
    change_column_default :ratings, :feedback, 'Type Specific Feedback Here'
  end
end
