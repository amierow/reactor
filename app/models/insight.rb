class Insight < ApplicationRecord
  # Direct associations

  belongs_to :contributor,
             :counter_cache => :questions_count

  belongs_to :presentation

  # Indirect associations

  # Validations

end
