class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :locale, :default => I18n.locale.to_s
      t.string :full_name
      t.text :description
      t.string :password_reset_token
      t.datetime :password_reset_token_created_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
