require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Subject do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Subject.create!(@valid_attributes)
  end
  
  it "should validate length of course name to be at least 3 characters" do
    subject = Subject.new(@valid_attributes.merge(:name => ""))
    subject.should_not be_valid
    subject.should have(1).error_on(:name)
  end
end
