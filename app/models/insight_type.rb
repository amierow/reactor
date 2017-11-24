class InsightType < ApplicationRecord
  # Direct associations

  has_many   :insights,
             :foreign_key => "insght_type_id"

  # Indirect associations

  # Validations

end
