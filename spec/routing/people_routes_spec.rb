require 'spec_helper'

describe PeopleController do
  describe "Routing" do
    it "routes to #index" do
      {:get => "/people"}.should route_to({:controller => "people", :action => "index"})
    end
    
    it "routes to #new" do
      {:get => "/people/new"}.should route_to({:controller => "people", :action => "new"})
    end
    
    it "/peoples should not be routable" do
      {:get => "/peoples"}.should_not be_routable
    end
    
    it "routes to #show" do
      {:get => "/people/2"}.should route_to({:controller => "people", :action => "show", :id => "2"})
    end
    
    it "routes to #edit" do
      {:get => "/people/1/edit"}.should route_to({:controller => "people", :action => "edit", :id => "1"})
    end
    
    it "routes to #create" do
      {:post => "/people"}.should route_to({:controller => "people", :action => "create"})
    end
    
    it "routes to #update" do
      {:put => "/people/2"}.should route_to({:controller => "people", :action => "update", :id => "2"})
    end
    
    it "routes to #delete" do
      {:delete => "people/2"}.should route_to({:controller => "people", :action => "destroy", :id => "2"})
    end
  end
end