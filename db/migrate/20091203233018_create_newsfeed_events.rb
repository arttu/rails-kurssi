class CreateNewsfeedEvents < ActiveRecord::Migration
  def self.up
    create_table :newsfeed_events do |t|
      t.string :text

      t.timestamps
    end
  end

  def self.down
    drop_table :newsfeed_events
  end
end
