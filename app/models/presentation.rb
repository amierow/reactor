class Presentation < ApplicationRecord
  # Direct associations

  has_many   :insights

  has_many   :contributors

  belongs_to :lead,
             :counter_cache => true

  # Indirect associations

  has_many   :question_ratings,
             :through => :insights,
             :source => :question_ratings

  # Validations

end
