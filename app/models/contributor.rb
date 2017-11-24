class Contributor < ApplicationRecord
  # Direct associations

  has_many   :question_ratings,
             :class_name => "Rating"

  has_many   :question_votes,
             :class_name => "Vote"

  has_many   :questions,
             :class_name => "Insight"

  belongs_to :presentation,
             :counter_cache => true

  # Indirect associations

  has_one    :lead,
             :through => :presentation,
             :source => :lead

  # Validations

end
