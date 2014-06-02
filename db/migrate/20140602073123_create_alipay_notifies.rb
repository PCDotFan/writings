class CreateAlipayNotify < ActiveRecord::Migration
  def change
    create_table :alipay_notifies do |t|
      t.boolean :verify
      t.text :params

      t.references :order

      t.timestamps
    end
  end
end
