require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExerciseGroupsController do

  describe "GET 'register'" do
    setup :activate_authlogic

    integrate_views

    it_should_behave_like "logged in user"

    it "should be successful" do
      s = Subject.create(:name => "sadf", :description => "kgfhalkjasdgh")
      c = Course.create(:subject_id => s.id, :name => "sdfgasf")
      eg = ExerciseGroup.create(:course_id => c.id, :starts_at => 1.hour.ago, :ends_at => 1.hour.from_now)
      
      post 'register', :id => eg.id, :course_id => c.id, :subject_id => s.id

      response.should be_redirect
    end
  end
end
