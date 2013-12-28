require 'spec_helper'

describe PeopleController do
  before do
    user = create(:user)
    sign_in(user)
  end
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.code.should == "200"
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

  describe "Post 'create" do
    before do
      @post_params = {:person =>
        {:first_name => "John",
          :last_name => "Doe", 
          :addresses_attributes => [
            {:city => "Melbourne",
              :street => "41 Stewart",
              :state => "VIC",
              :zip => "3091"
            }
          ]
        }
      }
    end
    
    it "should assign a @person variable" do
      post :create, @post_params
      assigns[:person].should_not be_nil
      assigns[:person].should be_kind_of(Person)
    end
    context "when successful" do
      before do
        post :create, @post_params
      end
      it "should redirect to index" do
        response.should redirect_to(people_path)
      end
      
      it "should create a Person object" do
        lambda{
          post :create, @post_params
        }.should change(Person, :count).by(1)
      end
    end
    
    context "when failure" do
      before do
        @post_params[:person][:first_name] = ''
      end
      it "re-renders the 'new' template" do
        post :create, @post_params
        response.should render_template("new")
      end
      
      it "doesn't create a person object" do
        lambda{
          post :create, @post_params
        }.should_not change(Person, :count)
      end
    end
  end
end
