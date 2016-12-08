class AddProposedChecks < ActiveRecord::Migration[5.0]
  def change
      add_column :bills, :proposed_paycheck_id, :integer
  end
end
