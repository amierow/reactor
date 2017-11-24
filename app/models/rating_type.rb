class RatingType < ApplicationRecord
  # Direct associations

  has_many   :rating_levels,
             :dependent => :destroy

  has_many   :question_ratings,
             :class_name => "Rating"

  # Indirect associations

  # Validations

end
