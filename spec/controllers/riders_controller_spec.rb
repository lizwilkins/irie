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

  context 'GET index' do
    let(:rider) {FactoryGirl.create(:rider)}

    context 'with authorized session' do
      before {get :index, {}, {'rider_id' => rider.id}}
      it {should render_template :index}
    end

    context 'without authorized session' do
      before {get :index, {}, {}}
      it {should render_template :index}
    end
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:balance => 100.00, :user_id => 100}}
      let(:valid_parameters) {{:rider => valid_attributes}}
      let(:rider) {FactoryGirl.create :rider}

      it 'creates a new rider' do
        expect {post :create, valid_parameters}.to change(Rider, :count).by(1) 
      end

      context 'before create' do 
        before {post :create, valid_parameters}
        it {should set_the_flash[:notice]}
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:balance =>nil}}
      let(:invalid_parameters) {{:rider => invalid_attributes}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert].to("There were errors creating your rider profile.").now}
      it {should render_template :new}
    end
  end

  context 'GET edit' do
    let(:rider) {FactoryGirl.create :rider}
    before {get :edit, {:id => rider.id}, {'rider_id' => rider.id}}

    it {should render_template :edit}
  end

  context 'GET show' do
    let(:rider) {FactoryGirl.create :rider}
    before {get :edit, {:id => rider.id}, {'rider_id' => rider.id}}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:rider) {FactoryGirl.create :rider}

    context 'with authorized session' do
      context 'with valid parameters' do 
        let(:valid_attributes) {{:balance => 95.00}}
        let(:valid_parameters) {{:id => rider.id, :rider => valid_attributes}}
        before {put :update, valid_parameters, 'rider_id' => rider.id}

        it 'updates the rider attributes' do
          Rider.find(rider.id).balance.should eq valid_attributes[:balance]
        end

        it {should set_the_flash[:notice].to("Your rider profile was successfully updated.")}
        it {should redirect_to rider_path(rider)}
      end

      context 'with invalid parameters' do
        let(:invalid_attributes) {{:balance => nil}}
        let(:invalid_parameters) {{:id => rider.id, :rider => invalid_attributes}}
        before {put :update, invalid_parameters, 'rider_id' => rider.id}

        it {should render_template :edit}
        it {should set_the_flash[:alert].to("There were errors updating your rider profile.").now}
      end
    end

  end

  context 'DELETE destroy' do 

    context 'with authorized session' do
      it 'destroys a rider' do
        rider = FactoryGirl.create :rider
        expect {delete :destroy, {:id => rider.id}, {:rider_id => rider.id}}.to change(Rider, :count).by(-1)
      end

      let(:rider) {FactoryGirl.create(:rider)}
      before {delete :destroy, {:id => rider.id}, {'rider_id' => rider.id}}
      it {should redirect_to root_path}
    end

    context 'without authorized session' do
      it 'does not destroy a rider' 
    end
  end  
end