class Bill < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :amount_due, :numericality => { :greater_than => 0 }

  validates :date_due, :uniqueness => { :scope => [:recipient], :message => "All bills due to be paid to the same recipient on the same date must be summed together into a single total amount due to the recipient on that date" }

  validates :date_due, :presence => true

  validates :recipient, :uniqueness => { :scope => [:date_due], :message => "All bills due to be paid to the same recipient on the same date must be summed together into a single total amount due to the recipient on that date" }

  validates :recipient, :presence => true

  validates :recipient, :length => { :maximum => 15 }

end
