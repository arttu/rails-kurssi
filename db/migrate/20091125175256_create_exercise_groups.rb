class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.integer :course_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :classroom

      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
