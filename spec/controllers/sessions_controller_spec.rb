require 'spec_helper'

describe SessionsController do
  context 'routing' do
    it {should route(:get, '/sessions/new').to :action => :new}    
    it {should route(:post, '/sessions').to :action => :create}
    it {should route(:delete, '/sessions/1').to :action => :destroy, :id => 1}

  end

  context 'POST create' do
    it "creates a session and sets the session's user id to the user's id" do
      user = FactoryGirl.create(:user)
      post :create, :username => user.username, :password => user.password
      session[:user_id].should eq user.id
    end
  end

  context 'DELETE destroy' do
    it "destroys a session and sets the session's user id to nil" do
      user = FactoryGirl.create(:user)
      post :create, :username => user.username, :password => user.password
      delete :destroy
      session[:user_id].should be_nil
    end
  end 

end