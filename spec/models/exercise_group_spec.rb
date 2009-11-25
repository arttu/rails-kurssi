require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExerciseGroup do
  before(:each) do
    @valid_attributes = {
      :course_id => 1,
      :starts_at => Time.now,
      :ends_at => Time.now,
      :classroom => "value for classroom"
    }
  end

  it "should create a new instance given valid attributes" do
    ExerciseGroup.create!(@valid_attributes)
  end
end
