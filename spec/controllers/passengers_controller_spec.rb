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

  context 'GET index' do
    let(:passenger) {FactoryGirl.create(:passenger)}

    context 'with authorized session' do
      before {get :index, {}, {'passenger_id' => passenger.id}}
      it {should render_template :index}
    end

    context 'without authorized session' do
      before {get :index, {}, {}}
      it {should render_template :index}
    end
  end

  # context 'GET new' do
  #   before {get :new}

  #   it {should render_template :new}
  # end

  # context 'POST create' do 
  #   context 'with valid parameters' do
  #     let(:valid_attributes) {{:trip_id => 1, :rider_id => 1}}
  #     let(:valid_parameters) {{:passenger => valid_attributes}}

  #     it 'creates a new passenger' do
  #       expect {post :create, valid_parameters}.to change(Passenger, :count).by(1) 
  #     end

  #     context 'before create' do 
  #       before {post :create, valid_parameters}
  #       it {should redirect_to passengers_path}
  #       it {should set_the_flash[:notice]}
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     let(:invalid_attributes) {{:rider_id => 1}}
  #     let(:invalid_parameters) {{:passenger => invalid_attributes}}
 
  #     before {post :create, invalid_parameters}
  #     it {should set_the_flash[:alert].to("There were errors adding this passenger.").now}
  #     it {should render_template :new}
  #   end
  # end

  # context 'DELETE destroy' do 

  #   context 'with authorized session' do
  #     it 'destroys a passenger' do
  #       passenger = FactoryGirl.create(:passenger)
  #       expect {delete :destroy, {:id => passenger.id}, {:passenger_id => passenger.id}}.to change(Passenger, :count).by(-1)
  #     end

  #     let(:passenger) {FactoryGirl.create(:passenger)}
  #     before {delete :destroy, {:id => passenger.id}, {'passenger_id' => passenger.id}}
  #     it {should redirect_to passengers_path}
  #   end
  # end  
end