# Controller - with its actions, which may call private methods - represents
#   visitors' / users' interface to Model's CRUD methods aka resources

class StudentsController < ApplicationController
  def index
    @students = Student.order( :name ) # Load all students ordered by name
    # @students = Student.all
  end
  # Automatically load the app/views/students/index.html.erb

  def show
    @student = find_student # Load the student mentioned by id in the route
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
  # Explicitly redirect_to|render a resource

  def edit
    @student = find_student
  end

  def update
    @student = find_student

    if @student.update student_params
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = find_student
    @student.destroy
    redirect_to students_path
  end

  private

    def find_student
      Student.find params[:id]
    end

    def student_params
      params.require( :student ).permit( :name )
    end

end
