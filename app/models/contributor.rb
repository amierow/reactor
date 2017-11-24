class Contributor < ApplicationRecord
  # Direct associations

  belongs_to :presentation,
             :counter_cache => true

  # Indirect associations

  # Validations

end
