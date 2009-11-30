class CreateCourseRegistrations < ActiveRecord::Migration
  def self.up
    create_table :course_registrations do |t|
      t.integer :user_id
      t.integer :exercise_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :course_registrations
  end
end
