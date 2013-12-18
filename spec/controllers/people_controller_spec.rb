require 'spec_helper'

describe PeopleController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    it "should render 'index' template" do
      get :index
      response.should render_template('index')
    end
    
    it "assigns @people variable" do
      p = create(:person)
      get :index
      #assigns [people] reports @people  variable of the controller
      assigns[:people].should == [p]
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    
    it "should render template new" do
      get :new
      response.should render_template("new")
    end
    
    it "assigns a new person object" do
      get "new"
      assigns[:person].should_not be_nil
      assigns[:person].should be_kind_of(Person)
      assigns[:person].should be_new_record
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', {:id => "3"}
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, {:id => "2"}
      response.should be_success
    end
  end

end
