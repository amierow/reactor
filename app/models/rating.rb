class Rating < ApplicationRecord
  # Direct associations

  belongs_to :contributor,
             :counter_cache => :question_ratings_count

  # Indirect associations

  # Validations

end
