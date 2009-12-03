class SubjectsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update, :new, :create]

  def index
    @subjects = Subject.all
    @newsfeed_events = NewsfeedEvent.newest(15)
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(params[:subject])
    
    if @subject.save
      NewsfeedEvent.create(:text => "A new subject was created: #{@subject.name}")
      redirect_to subject_path(@subject)
    else
      render(:action => 'new')
    end
  end
end
