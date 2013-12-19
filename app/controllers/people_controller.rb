class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    
  end

  def edit
  end
  
  def create 
    @person = Person.new(person_params)
    if @person.valid?
      @person.save
      flash[:notice] = "Successfully saved"
      redirect_to people_path
    else
      render :new
    end
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def person_params
    params.require(:person).permit(:first_name, :last_name,:middle_name)
  end
end
