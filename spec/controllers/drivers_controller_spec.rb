require 'spec_helper'

describe DriversController do
  context 'routing' do
   it {should route(:get, '/drivers/new').to :action => :new}    
    it {should route(:post, '/drivers').to :action => :create}
    it {should route(:put, '/drivers/1').to :action => :update, :id => 1}
    it {should route(:delete, '/drivers/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/drivers').to :action => :index}
    it {should route(:get, '/drivers/1').to :action => :show, :id => 1}
    it {should route(:get, '/drivers/1/edit').to :action => :edit, :id =>1}
  end
end