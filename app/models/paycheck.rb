class Paycheck < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :date_received, :presence => true

  validates :income_source, :uniqueness => { :scope => [:date_received], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :income_source, :presence => true

end
