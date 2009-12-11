require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CourseExamRegistration do
  before(:each) do
    @valid_attributes = {
      :course_exam_id => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    CourseExamRegistration.create!(@valid_attributes)
  end
end
