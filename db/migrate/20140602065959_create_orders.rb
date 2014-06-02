class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :plan
      t.integer :quantity
      t.integer :price, :default => 0
      t.integer :discount, :default => 0
      t.string :state, :default => 'opening'
      t.datetime :pending_at
      t.datetime :completed_at
      t.datetime :canceled_at
      t.datetime :paid_at
      t.datetime :start_at
      t.string :trade_no

      t.references :space, index: true

      t.timestamps
    end
  end
end
