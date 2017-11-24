class Vote < ApplicationRecord
  # Direct associations

  belongs_to :question,
             :class_name => "Insight",
             :foreign_key => "insight_id",
             :counter_cache => :question_votes_count

  belongs_to :contributor

  # Indirect associations

  # Validations

end
