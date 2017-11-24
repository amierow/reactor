class Contributor < ApplicationRecord
  # Direct associations

  has_many   :questions,
             :class_name => "Insight"

  belongs_to :presentation,
             :counter_cache => true

  # Indirect associations

  # Validations

end
