class AddProposedChhec < ActiveRecord::Migration[5.0]
  def change
    add_column :bills, :proposed_paycheck, :integer
  end
end
