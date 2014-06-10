class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :urlname
      t.string :status, :default => 'draft'
      t.integer :save_count, :default => 0
      t.integer :last_version_save_count, :default => 0
      t.datetime :published_at
      t.string :token

      t.references :user
      t.references :space
      t.references :last_edit_user

      t.timestamps
    end

    add_index :articles, [:space_id, :token], :unique => true
  end
end
