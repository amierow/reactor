class Rating < ApplicationRecord
  # Direct associations

  belongs_to :question,
             :class_name => "Insight",
             :foreign_key => "insight_id",
             :counter_cache => :question_ratings_count

  belongs_to :contributor,
             :counter_cache => :question_ratings_count

  # Indirect associations

  # Validations

end
