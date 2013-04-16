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
    let(:user) {FactoryGirl.create(:user)}

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
    admin = FactoryGirl.create(:admin) 
    before {get :new, {'trip_id' => passenger.trip.id, :user_id => admin.id}}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:trip_id => 1, :rider_id => 1}}
      let(:valid_parameters) {{:passenger => valid_attributes}}

      it 'creates a new passenger' do
        expect {post :create, valid_parameters}.to change(Passenger, :count).by(1) 
      end

      context 'before create' do 
        before {post :create, valid_parameters}
        it {should redirect_to passengers_path}
        it {should set_the_flash[:notice]}
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:rider_id => 1}}
      let(:invalid_parameters) {{:passenger => invalid_attributes}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert].to("There were errors adding this passenger.").now}
      it {should render_template :new}
    end
  end

  context 'DELETE destroy' do 

    context 'with authorized session' do
      it 'destroys a passenger' do
        passenger = FactoryGirl.create(:passenger)
        admin = FactoryGirl.create(:admin) 
        expect {delete :destroy, {:id => passenger.id}, {:user_id => admin.id}}.to change(Passenger, :count).by(-1)
      end

      let(:passenger) {FactoryGirl.create(:passenger)}
      before {delete :destroy, {:id => passenger.id}, {'passenger_id' => passenger.id}, {'trip_id' => passenger.trip.id}}
      it {should redirect_to passengers_path}
    end
  end  
end