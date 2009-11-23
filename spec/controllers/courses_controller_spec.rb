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
    
    response.should have_tag("div>a.name", "course1")
    response.should have_tag("div>a.name", "course2")
    response.should have_tag("div>a.name", "course3")
  end

  it "should show one course" do
    course = Course.create(:name => "sample course", :description => "very short description")
    
    get "show", :id => course.id
    
    response.should be_success

    response.should have_tag('a[href=/courses]', 'Back to list')
    response.should have_tag('div.name', 'sample course')
    response.should have_tag('div.description', 'very short description')
  end
end

describe CoursesController, "login required" do
  setup :activate_authlogic
  
  integrate_views

  it_should_behave_like "logged in user"

  it "should show new course form" do
    
    get "new"
    
    response.should be_success
    
    response.should have_tag('form[action=/courses][method=post]')
    response.should have_tag('input[id=course_name]')
    response.should have_tag('textarea[id=course_description]')
  end
  
  it "should create course" do
    lambda {
      post "create", :course => {:name => 'testing', :description => 'course creation'}
    }.should change(Course, :count).by(1)
    
    response.should be_redirect
    response.should redirect_to(course_path(assigns(:course)))
  end
  
  it "should redirect to new if create fails" do
    lambda {
      post "create", :course => {:name => 'x', :description => 'course creation'}
    }.should_not change(Course, :count)
    
    response.should render_template('courses/new')
    response.should have_text(/Name is too short/)
  end
end
