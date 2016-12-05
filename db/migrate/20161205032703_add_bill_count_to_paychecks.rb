class AddBillCountToPaychecks < ActiveRecord::Migration[5.0]
  def change
    add_column :paychecks, :bills_count, :integer
  end
end
