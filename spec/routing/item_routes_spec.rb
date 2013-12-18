require 'spec_helper'

describe ItemsController do
  describe "Routing" do
   it "should route to #index" do
      {:get => '/items'}.should route_to({:controller => "items", :action => "index"})
    end
  end
  
  it "should route to #edit" do
    {:get => "/items/2/edit"}.should route_to({:controller => "items", :action => "edit", :id => "2"})
  end
end