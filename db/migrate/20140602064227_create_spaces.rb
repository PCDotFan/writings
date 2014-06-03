class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, :index=> true, :unique => true
      t.string :domain, :index=> true, :unique => true, :sparse => true
      t.string :disqus_shortname
      t.string :google_analytics_id
      t.string :full_name
      t.text :description
      t.string :gravatar_email
      t.string :plan, :default => 'free'
      t.datetime :plan_expired_at
      t.integer :storage_used, :default => 0

      t.timestamps
    end
  end
end
