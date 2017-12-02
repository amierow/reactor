class Vote < ApplicationRecord
  # Direct associations

  belongs_to :insight,
             :class_name => "Insight",
             :foreign_key => "insight_id",
             :counter_cache => :question_votes_count

  belongs_to :contributor

  # Indirect associations

  # Validations
  validates :insight_id, :presence => true, :uniqueness => {:scope => :contributor_id}
  validates :vote, :numericality => {:greater_than_or_equal_to => -1, :less_than_or_equal_to => 1}


end
