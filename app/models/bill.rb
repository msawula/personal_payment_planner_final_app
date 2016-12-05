class Bill < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient, :presence => true

  validates :recipient, :length => { :maximum => 15 }

end
