class Lead < ApplicationRecord
  # Direct associations

  has_many   :presentations

  # Indirect associations

  has_many   :contributors,
             :through => :presentations,
             :source => :contributors

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
