class CreateUsersSpaces < ActiveRecord::Migration
  def change
    create_table :users_spaces do |t|
      t.references :user, :index=> true
      t.references :space, :index=> true

      t.timestamps
    end
  end
end
