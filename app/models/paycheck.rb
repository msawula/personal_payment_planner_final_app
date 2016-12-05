class Paycheck < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :income_source, :presence => true

end
