require 'spec_helper'

describe RidersController do
  context 'routing' do
   it {should route(:get, '/riders/new').to :action => :new}    
    it {should route(:post, '/riders').to :action => :create}
    it {should route(:put, '/riders/1').to :action => :update, :id => 1}
    it {should route(:delete, '/riders/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/riders').to :action => :index}
    it {should route(:get, '/riders/1').to :action => :show, :id => 1}
    it {should route(:get, '/riders/1/edit').to :action => :edit, :id =>1}
  end
end