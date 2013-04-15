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

  context 'PUT update' do
    let(:bus) {FactoryGirl.create :bus}

    context 'with authorized session' do
      context 'with valid parameters' do 
        let(:valid_attrs) {{:license_number => bus.license_number, :capacity => 55, :description => 'yellow submarine'}}
        let(:valid_params) {{:id => bus.id, :bus => valid_attrs}}
        before {put :update, valid_params, 'bus_id' => bus.id}

        it 'updates the bus attributes' do
          Bus.find(bus.id).capacity.should eq valid_attrs[:capacity]
        end

        it {should set_the_flash[:notice].to("The bus was successfully updated.")}
        it {should redirect_to buses_path}
      end

      context 'with invalid parameters' do
        let(:invalid_attrs) {{:license_number => bus.license_number, :capacity => 55, :description => ""}}
        let(:invalid_params) {{:id => bus.id, :bus => invalid_attrs}}
        before {put :update, invalid_params, 'bus_id' => bus.id}

        it {should render_template :edit}
        it {should set_the_flash[:alert].to("There were errors updating the bus.").now}
      end
    end
  end

  context 'DELETE destroy' do 

    context 'with authorized session' do
      it 'destroys a bus' do
        bus = FactoryGirl.create :bus
        expect {delete :destroy, {:id => bus.id}, {:bus => bus.id}}.to change(Bus, :count).by(-1)
      end

      let(:bus) {FactoryGirl.create(:bus)}
      before {delete :destroy, {:id => bus.id}, {'bus' => bus.id}}
      it {should redirect_to buses_path}
    end

    context 'with unauthorized session' do
      it "doesn't destroy a bus"
    end
  end      
end