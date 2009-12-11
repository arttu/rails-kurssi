class AddRegistrationLimitForExerciseGroup < ActiveRecord::Migration
  def self.up
    add_column :exercise_groups, :max_students, :integer, :default => 15
  end

  def self.down
    remove_column :exercise_groups, :max_students
  end
end
