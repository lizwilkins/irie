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

  context 'GET new' do
    let(:admin) {FactoryGirl.create(:admin)}
    before {get :new, {}, {:user_id => admin.id}}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid params' do
      let(:trip) {FactoryGirl.build(:trip)}
      let(:admin) {FactoryGirl.create(:admin)}
      let(:valid_attributes) {{:route_id => 1, :bus_id => 1, :driver_id => 1, :departure => Date.today}}
      let(:valid_parameters) {{:trip => valid_attributes}}

      it 'creates a new trip' do
        expect {post :create, valid_parameters, {:user_id => admin.id}}.to change(Trip, :count).by(1)
      end

      context 'response' do
        let(:admin) {FactoryGirl.create(:admin)}
        before {post :create, valid_parameters, {:user_id => admin.id}}
        it {should redirect_to trips_path}
        it {should set_the_flash[:notice]}
      end   
    end

    context 'with invalid params' do
      let(:admin) {FactoryGirl.create(:admin)}
      let(:invalid_attributes) {{:route_id => 1, :bus_id => 1, :driver_id => nil, :departure => Date.today}}
      let(:invalid_parameters) {{:trip => invalid_attributes}}

      it 'does not create a new trip' do
        expect {post :create, invalid_parameters, {:user_id => admin.id}}.to change(Trip, :count).by(0)
      end

      before {post :create, invalid_parameters, {:user_id => admin.id}}
      it {should render_template :new}
    end
  end

  context 'GET index' do
    let(:admin) {FactoryGirl.create(:admin)}
    before {get :index, {}, {:user_id => admin.id}}
    it {should render_template :index}
  end  

  context 'GET edit' do
    let(:admin) {FactoryGirl.create(:admin)}
    let(:trip) {FactoryGirl.create(:trip)}
    before {get :edit, {:id => trip.id}, {:user_id => admin.id}}
    it {should render_template :edit}
  end

  context 'PUT update' do
    context 'with valid params' do
      let(:trip) {FactoryGirl.create(:trip)}
      let(:valid_attributes) {{:route_id => 1, :bus_id => 2, :driver_id => 1, :departure => Date.today}}
      let(:valid_parameters) {{:id => trip.id, :trip => valid_attributes}}
      let(:admin) {FactoryGirl.create(:admin)}

      before {put :update, valid_parameters, {:user_id => admin.id}}      
      it 'updates attribute(s)' do
        trip.reload
        trip.bus_id.should eq valid_attributes[:bus_id]
      end

      it {should set_the_flash[:notice]}
      it {should redirect_to trips_path}
    end

    context 'with invalid params' do
      let(:trip) {FactoryGirl.create(:trip)}
      let(:invalid_attributes) {{:route_id => 1, :bus_id => 1, :driver_id => nil, :departure => Date.today}}
      let(:invalid_parameters) {{:id => trip.id, :trip => invalid_attributes}}
      let(:admin) {FactoryGirl.create(:admin)}

      before {put :update, invalid_parameters, {:user_id => admin.id}}
      it {should render_template :edit}
    end
  end

  context 'DELETE destroy' do
    context 'with authorized session' do
      it 'destroys the trip' do
        trip = FactoryGirl.create(:trip)
        admin = FactoryGirl.create(:admin)
        expect {delete :destroy, {:id => trip.id}, {:user_id => admin.id}}.to change(Trip, :count).by(-1)
      end   

      context 'response' do
        let(:trip) {FactoryGirl.create(:trip)}
        let(:admin) {FactoryGirl.create(:admin)}

        before {delete :destroy, {:id => trip.id}, {:user_id => admin.id}}
        it {should redirect_to trips_path}
        it {should set_the_flash[:notice]}
      end
    end

    context 'without authorized session' do
      it 'should not destroy the trip'
    end
  end
end