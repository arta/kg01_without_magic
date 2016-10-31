class StudentsController < ApplicationController
  def index
    @students = Student.order( :name ) # Load all students ordered by name
    # @students = Student.all
  end
  # Automatically load the app/views/students/index.html.erb

  def show
    @student = Student.find( params[:id] ) # Load the student mentioned by id in the route
  end
  # Automatically load the app/views/students/show.html.erb

  def new
    @student = Student.new
  end
  # Automatically load the app/views/students/new.html.erb

  def create
    @student = Student.new( student_params )

    if @student.save # If the validations pass
      redirect_to @student # Redirect to show action for this student
    else # If the validations fail
      render :new # Render the view associated with the new action.
    end
  end
  # This action does not have an associated view!
  # Automatically load the app/views/students/:id ?

  private
  def student_params
    params.require( :student ).permit( :name )
  end

end
