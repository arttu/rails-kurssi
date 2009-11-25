require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubjectsController do
  integrate_views

  it "should show index action" do
    get "index"
    
    response.should be_success
    response.should have_tag("h2", "Subjects")
  end
  
  it "should show three subjects" do
    (1..3).each do |i|
      Subject.create(:name => "subject#{i}", :description => "desc#{i}")
    end
    
    get "index"
    
    response.should have_tag("div>a.name", "subject1")
    response.should have_tag("div>a.name", "subject2")
    response.should have_tag("div>a.name", "subject3")
  end

  it "should show one subject" do
    subject = Subject.create(:name => "sample subject", :description => "very short description")
    
    get "show", :id => subject.id
    
    response.should be_success

    response.should have_tag('a[href=/subjects]', 'Back to list')
    response.should have_tag('div.name', 'sample subject')
    response.should have_tag('div.description', 'very short description')
  end
end

describe SubjectsController, "login required" do
  setup :activate_authlogic
  
  integrate_views

  it_should_behave_like "logged in user"

  it "should show new subject form" do
    
    get "new"
    
    response.should be_success
    
    response.should have_tag('form[action=/subjects][method=post]')
    response.should have_tag('input[id=subject_name]')
    response.should have_tag('textarea[id=subject_description]')
  end
  
  it "should create subject" do
    lambda {
      post "create", :subject => {:name => 'testing', :description => 'subject creation'}
    }.should change(Subject, :count).by(1)
    
    response.should be_redirect
    response.should redirect_to(subject_path(assigns(:subject)))
  end
  
  it "should redirect to new if create fails" do
    lambda {
      post "create", :subject => {:name => 'x', :description => 'subject creation'}
    }.should_not change(Subject, :count)
    
    response.should render_template('subjects/new')
    response.should have_text(/Name is too short/)
  end
end
