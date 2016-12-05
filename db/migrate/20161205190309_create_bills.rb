class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :recipient
      t.date :date_due
      t.integer :amount_due
      t.string :website_to_pay_bill
      t.integer :paycheck_id
      t.integer :user_id

      t.timestamps

    end
  end
end
