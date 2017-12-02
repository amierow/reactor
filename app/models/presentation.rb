class Presentation < ApplicationRecord
  # Direct associations

  has_many   :insights

  has_many   :contributors

  belongs_to :lead,
             :counter_cache => true

  # Indirect associations

  # Validations
  validates :lead_id, :presence => true
  validates :date, :presence => true 
  validates :name, :presence => true, :uniqueness => {:scope => :date }

end
