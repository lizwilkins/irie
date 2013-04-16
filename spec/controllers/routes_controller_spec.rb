require 'spec_helper'

describe RoutesController do

  context 'routing' do
    it {should route(:get, '/routes/new').to :action => :new}    
    it {should route(:get, '/routes/1/edit').to :action => :edit, :id => 1}
    it {should route(:post, '/routes').to :action => :create}
    it {should route(:put, '/routes/1').to :action => :update, :id => 1}
    it {should route(:delete, '/routes/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/routes').to :action => :index}
    it {should route(:get, '/routes/1').to :action => :show, :id => 1}
  end

  context 'GET new' do
    let(:admin) {FactoryGirl.create(:admin)}
    before {get :new, {}, {:user_id => admin.id}}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid params' do
      let(:route) {FactoryGirl.build(:route)}
      let(:admin) {FactoryGirl.create(:admin)}
      let(:valid_attributes) {{:number => route.number, :origin => route.origin, :destination => route.destination, :path => route.path}}
      let(:valid_parameters) {{:route => valid_attributes}}

      it 'creates a new route' do
        expect {post :create, valid_parameters, {:user_id => admin.id}}.to change(Route, :count).by(1)
      end

      context 'response' do
        before {post :create, valid_parameters, {:user_id => admin.id}}
        it {should redirect_to routes_path}
        it {should set_the_flash[:notice]}
      end   
    end

    context 'with invalid params' do
      let(:invalid_attributes) {{:number => '', :origin => '', :destination => '', :path => ''}}
      let(:invalid_parameters) {{:route => invalid_attributes}}
      let(:user) {FactoryGirl.create(:user_as_rider)}
      let(:admin) {FactoryGirl.create(:admin)}

      it 'does not create a new route' do
        expect {post :create, invalid_parameters, {:user_id => user.id}}.to change(Route, :count).by(0)
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
    let(:route) {FactoryGirl.create(:route)}
    let(:admin) {FactoryGirl.create(:admin)}
    before {get :edit, {:id => route.id}, {:user_id => admin.id}}
    it {should render_template :edit}
  end

  context 'PUT update' do
    context 'with valid params' do
      let(:route) {FactoryGirl.create(:route)}
      let(:admin) {FactoryGirl.create(:admin)}
      let(:valid_attributes) {{:number => '5F'}}
      let(:valid_parameters) {{:id => route.id, :route => valid_attributes}}

      before {put :update, valid_parameters, {:user_id => admin.id}}      
      it 'updates attribute(s)' do
        route.reload
        route.number.should eq '5F'
      end
      it {should set_the_flash[:notice]}
      it {should redirect_to routes_path}
    end

    context 'with invalid params' do
      let(:route) {FactoryGirl.create(:route)}
      let(:invalid_attributes) {{:number => ''}}
      let(:invalid_parameters) {{:id => route.id, :route => invalid_attributes}}
      let(:admin) {FactoryGirl.create(:admin)}

      before {put :update, invalid_parameters, {:user_id => admin.id}}
      it {should render_template :edit}
    end
  end

  context 'DELETE destroy' do
    context 'with authorized session' do
      it 'destroys the route' do
        route = FactoryGirl.create(:route)
        admin = FactoryGirl.create(:admin)
        expect {delete :destroy, {:id => route.id}, :user_id => admin.id}.to change(Route, :count).by(-1)
      end   

      context 'response' do
        let(:route) {FactoryGirl.create(:route)}
        let(:admin) {FactoryGirl.create(:admin)}

        before {delete :destroy, {:id => route.id}, :user_id => admin.id}
        it {should redirect_to routes_path}
        it {should set_the_flash[:notice]}
      end
    end

    context 'without authorized session' do
      it 'should not destroy the route'
        # route = FactoryGirl.create(:route)
        # expect {delete :destroy, {:id => route.id}}.to change(Route, :count).by(0)
    end
  end
end
