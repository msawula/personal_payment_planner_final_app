class Paycheck < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :average_amount, :numericality => { :greater_than => 0 }

  validates :date_received, :uniqueness => { :scope => [:income_source], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :date_received, :presence => true

  validates :income_source, :uniqueness => { :scope => [:date_received], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :income_source, :presence => true

end
