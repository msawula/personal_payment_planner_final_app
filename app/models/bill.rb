class Bill < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipient, :uniqueness => { :scope => [:date_due], :message => "All bills due to be paid to the same recipient on the same date must be summed together into a single total amount due to the recipient on that date" }

  validates :recipient, :presence => true

  validates :recipient, :length => { :maximum => 15 }

end
