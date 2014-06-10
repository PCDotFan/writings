class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :title
      t.text :body

      t.references :article, index: true
      t.references :space

      t.timestamps
    end
  end
end
