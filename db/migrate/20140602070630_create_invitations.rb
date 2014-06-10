class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.string :email
      t.text :message

      t.references :space

      t.timestamps
    end

    add_index :invitations, [:space_id, :token], :unique => true
  end
end
