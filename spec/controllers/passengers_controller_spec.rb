require 'spec_helper'

describe PassengersController do
  context 'routing' do
    it {should route(:get, '/trips/1/passengers/new').to :action => :new, :trip_id => 1}    
    it {should route(:post, '/trips/1/passengers').to :action => :create, :trip_id => 1}
    it {should route(:delete, '/trips/1/passengers/1').to :action => :destroy, :trip_id => 1, :id => 1}
    it {should route(:get, '/trips/1/passengers').to :action => :index, :trip_id => 1}
  end

  context 'GET index' do
    let(:passenger) {FactoryGirl.create(:passenger)}
    let(:admin) {FactoryGirl.create(:admin)}
    let(:user) {FactoryGirl.create(:user_as_rider)}

    context 'with authorized session' do
      before {get :index, {'trip_id' => passenger.trip.id}, {'user_id' => admin.id}}
      it {should render_template :index}
    end

    context 'without authorized session' do
      before {get :index, {'trip_id' => passenger.trip.id}, {'user_id' => user.id}}
      it {should redirect_to root_path}
    end
  end

  context 'GET new' do
    let(:trip) {FactoryGirl.create(:trip)}
    let(:user) {FactoryGirl.create(:user_as_rider)}
    before {get :new, {:trip_id => trip.id}, {'user_id' => user.id}}
    it {should render_template :new}
  end

  context 'POST create' do 
    let(:trip) {FactoryGirl.create(:trip)}
    context 'with valid parameters' do
      let(:valid_attributes) {{:rider_id => 1}}
      let(:valid_parameters) {{:passenger => valid_attributes, :trip_id => trip.id}}

      it 'creates a new passenger' do
        expect {post :create, valid_parameters}.to change(Passenger, :count).by(1) 
      end

      context 'before create' do 
        before {post :create, valid_parameters}
        it {should redirect_to trip_passengers_path(trip.id)}
        it {should set_the_flash[:notice]}
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:rider_id => ""}}
      let(:invalid_parameters) {{:passenger => invalid_attributes, :trip_id => trip.id}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert].to("There were errors adding this passenger.").now}
      it {should render_template :new}
    end
  end

  context 'DELETE destroy' do 
    let(:trip) {FactoryGirl.create(:trip_with_passengers)}
    
    context 'with authorized session' do

      it 'destroys a passenger' do
        passenger = trip.passengers.first
        expect {delete :destroy, {:trip_id => trip.id, :id => passenger.id}}.to change(Passenger, :count).by(-1)
      end

      it 'redirects to passengers list for that trip' do
        passenger = trip.passengers.first
        delete :destroy, {:trip_id => trip.id, :id => passenger.id}
        should redirect_to trip_passengers_path(trip.id)
      end
    end
  end  
end