require 'spec_helper'

describe TripsController do
  context 'routing' do
   it {should route(:get, '/trips/new').to :action => :new}    
    it {should route(:post, '/trips').to :action => :create}
    it {should route(:put, '/trips/1').to :action => :update, :id => 1}
    it {should route(:delete, '/trips/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/trips').to :action => :index}
    it {should route(:get, '/trips/1').to :action => :show, :id => 1}
    it {should route(:get, '/trips/1/edit').to :action => :edit, :id =>1}
  end
end