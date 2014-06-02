class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :title
      t.text :body

      t.references :article, index: true
      t.references :user

      t.timestamps
    end
  end
end
