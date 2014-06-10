class CreateImportTasks < ActiveRecord::Migration
  def change
    create_table :import_tasks do |t|
      t.string :format
      t.string :status
      t.string :file

      t.references :space
      t.references :user

      t.timestamps
    end
  end
end
