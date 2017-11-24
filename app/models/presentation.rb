class Presentation < ApplicationRecord
  # Direct associations

  has_many   :contributors

  belongs_to :lead,
             :counter_cache => true

  # Indirect associations

  # Validations

end
