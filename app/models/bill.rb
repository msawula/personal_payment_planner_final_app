class Bill < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient, :length => { :maximum => 15 }

end
