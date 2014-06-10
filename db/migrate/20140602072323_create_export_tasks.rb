class CreateExportTasks < ActiveRecord::Migration
  def change
    create_table :export_tasks do |t|
      t.string :format
      t.string :status

      t.references :space
      t.references :user

      t.timestamps
    end
  end
end
