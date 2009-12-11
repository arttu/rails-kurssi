class CreateCourseExams < ActiveRecord::Migration
  def self.up
    create_table :course_exams do |t|
      t.integer :course_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :course_exams
  end
end
