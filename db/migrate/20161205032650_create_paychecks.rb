class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.date :date_received
      t.integer :average_amount
      t.string :income_source

      t.timestamps

    end
  end
end
