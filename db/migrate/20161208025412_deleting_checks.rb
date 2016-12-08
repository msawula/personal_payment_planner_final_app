class DeletingChecks < ActiveRecord::Migration[5.0]
  def change
    remove_column :bills, :proposed_paycheck

 end
end
