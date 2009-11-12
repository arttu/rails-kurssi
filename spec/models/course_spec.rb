require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Course.create!(@valid_attributes)
  end
  
  it "should validate length of course name to be at least 3 characters" do
    course = Course.new(@valid_attributes.merge(:name => ""))
    course.should_not be_valid
    course.should have(1).error_on(:name)
  end
end
