require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  before(:each) do
    @valid_attributes = {
      :subject_id => 1,
      :label => "value for label",
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Course.create!(@valid_attributes)
  end
end
