class Insight < ApplicationRecord
  # Direct associations

  has_many   :question_votes,
             :class_name => "Vote"

  belongs_to :contributor,
             :counter_cache => :questions_count

  belongs_to :presentation

  # Indirect associations

  # Validations

end
