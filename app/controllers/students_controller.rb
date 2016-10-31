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
end
