require 'spec_helper'

describe BusesController do
  context 'routing' do
    it {should route(:post, '/buses').to :action => :create}
    it {should route(:put, '/buses/1').to :action => :update, :id => 1}
    it {should route(:delete, '/buses/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/buses').to :action => :index}
    it {should route(:get, '/buses/new').to :action => :new}
    it {should route(:get, '/buses/1/edit').to :action => :edit, :id => 1}
    it {should route(:get, '/buses/1').to :action => :show, :id => 1}
  end

  context 'GET new' do
    before {get :new}
    it {should render_template :new}
  end

  context 'GET index' do
    before {get :index}
    it {should render_template :index}

    it "assigns all buses as @buses" do
      bus = FactoryGirl.create(:bus)
      get :index
      assigns(:buses).should eq([bus])
    end
  end

  context 'POST create' do
    context 'with valid params' do
      let(:valid_attrs) {{:license_number => "MT 500", :capacity => 39, :description => "Country Boy"}}
      let(:valid_params) {{:bus => valid_attrs}}
      it 'creates a new bus' do
        expect {post :create, valid_params}.to change(Bus, :count).by(1)
      end
    end
  end
end