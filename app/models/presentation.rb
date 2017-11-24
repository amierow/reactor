class Presentation < ApplicationRecord
  # Direct associations

  belongs_to :lead,
             :counter_cache => true

  # Indirect associations

  # Validations

end
