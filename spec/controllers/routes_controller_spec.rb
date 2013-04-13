require 'spec_helper'

describe RoutesController do
  context 'routing' do
    it {should route(:get, '/routes/new').to :action => :new}    
    it {should route(:post, '/routes').to :action => :create}
    it {should route(:put, '/routes/1').to :action => :update, :id => 1}
    it {should route(:delete, '/routes/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/routes').to :action => :index}
    it {should route(:get, '/routes/1').to :action => :show, :id => 1}
    it {should route(:get, '/routes/1/edit').to :action => :edit, :id =>1}
  end
end