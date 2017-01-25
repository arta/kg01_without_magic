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

  private

    def find_student
      Student.find params[:id]
    end

    def student_params
      params.require( :student ).permit( :name )
    end

end
