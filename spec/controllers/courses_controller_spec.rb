require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesController do
  integrate_views

  it "should show index action" do
    get "index"
    
    response.should be_success
    response.should have_tag("h2", "Courses")
  end
  
  it "should show three courses" do
    (1..3).each do |i|
      Course.create(:name => "course#{i}", :description => "desc#{i}")
    end
    
    get "index"
    
    response.should have_tag("td.name", "course1")
    response.should have_tag("td.description", "desc1")
    response.should have_tag("td.name", "course2")
    response.should have_tag("td.description", "desc2")
    response.should have_tag("td.name", "course3")
    response.should have_tag("td.description", "desc3")
  end

  it "should one course" do
    course = Course.create(:name => "sample course", :description => "very short description")
    
    get "show", :id => course.id
    
    response.should be_success
    response.should have_tag('h3.course_name', 'sample course')
    response.should have_tag('p.description', 'very short description')
  end
end
