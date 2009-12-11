class CreateCourseExamRegistrations < ActiveRecord::Migration
  def self.up
    create_table :course_exam_registrations do |t|
      t.integer :course_exam_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :course_exam_registrations
  end
end
