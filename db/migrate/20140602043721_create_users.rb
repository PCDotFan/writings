class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :index=> true, :unique => true
      t.string :password_digest
      t.string :email, :index=> true, :unique => true
      t.string :locale, :default => I18n.locale.to_s
      t.string :full_name
      t.text :description
      t.string :password_reset_token
      t.datetime :password_reset_token_created_at

      t.timestamps
    end
  end
end
