class Paycheck < ApplicationRecord
  # Direct associations

  belongs_to :user
  has_many   :bills,
             :dependent => :nullify
  has_many   :proposed_bills, :class_name => "Bill", :foreign_key => "proposed_paycheck_id"

  # Indirect associations

  # Validations

  validates :average_amount, :uniqueness => { :scope => [:date_received, :income_source], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :average_amount, :presence => true

  validates :average_amount, :numericality => { :greater_than => 0 }

  validates :date_received, :uniqueness => { :scope => [:income_source], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :date_received, :presence => true

  validates :income_source, :uniqueness => { :scope => [:date_received], :message => "All income received from the same source and on the same date must be summed together into a single total amount from the source on that date" }

  validates :income_source, :presence => true


  validates :user_id, :presence => true

end
