require 'spec_helper'

describe VansController do
  context 'routing' do
   it {should route(:get, '/vans/new').to :action => :new}    
    it {should route(:post, '/vans').to :action => :create}
    it {should route(:put, '/vans/1').to :action => :update, :id => 1}
    it {should route(:delete, '/vans/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/vans').to :action => :index}
    it {should route(:get, '/vans/1').to :action => :show, :id => 1}
    it {should route(:get, '/vans/1/edit').to :action => :edit, :id =>1}
  end
end