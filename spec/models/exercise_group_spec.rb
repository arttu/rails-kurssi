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
  
  it "should register a student to a group - only once" do
    u = User.create(:login => "johndoe", :email => "john@doe.com", :password => "pass", :password_confirmation => "pass")
    c = Course.create(:name => "course 1")
    eg = ExerciseGroup.create(@valid_attributes.merge(:course => c))
    
    eg.register_student!(u)
    eg.students.size.should == 1
    eg.students.map(&:login).should == ["johndoe"]
    
    eg.course.reload
    eg.register_student!(u)
    eg.students.size.should == 1
  end
end
