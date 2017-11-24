class Insight < ApplicationRecord
  # Direct associations

  belongs_to :insght_type,
             :class_name => "InsightType",
             :counter_cache => true

  has_many   :question_ratings,
             :class_name => "Rating"

  has_many   :question_votes,
             :class_name => "Vote"

  belongs_to :contributor,
             :counter_cache => :questions_count

  belongs_to :presentation

  # Indirect associations

  # Validations

end
