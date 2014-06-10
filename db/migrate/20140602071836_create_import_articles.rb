class CreateImportArticles < ActiveRecord::Migration
  def change
    create_table :import_articles do |t|
      t.string :title
      t.text :body
      t.string :urlname
      t.string :status
      t.datetime :published_at

      t.references :import_task

      t.timestamps
    end
  end
end
