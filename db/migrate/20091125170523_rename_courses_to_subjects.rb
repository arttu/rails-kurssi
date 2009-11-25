class RenameCoursesToSubjects < ActiveRecord::Migration
  def self.up
    rename_table :courses, :subjects
  end

  def self.down
    rename_table :subjects, :courses
  end
end
