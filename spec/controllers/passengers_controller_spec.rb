require 'spec_helper'

describe PassengersController do
  context 'routing' do
   it {should route(:get, '/passengers/new').to :action => :new}    
    it {should route(:post, '/passengers').to :action => :create}
    it {should route(:put, '/passengers/1').to :action => :update, :id => 1}
    it {should route(:delete, '/passengers/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/passengers').to :action => :index}
    it {should route(:get, '/passengers/1').to :action => :show, :id => 1}
    it {should route(:get, '/passengers/1/edit').to :action => :edit, :id =>1}
  end
end