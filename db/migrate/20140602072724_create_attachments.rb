class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.decimal :file_size
      t.string :token

      t.references :space
      t.references :user

      t.timestamps
    end
  end
end
