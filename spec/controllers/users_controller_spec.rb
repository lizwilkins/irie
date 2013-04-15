require 'spec_helper'

describe UsersController do
  context 'routing' do
   it {should route(:get, '/users/new').to :action => :new}    
    it {should route(:post, '/users').to :action => :create}
    it {should route(:put, '/users/1').to :action => :update, :id => 1}
    it {should route(:delete, '/users/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/users').to :action => :index}
    it {should route(:get, '/users/1/edit').to :action => :edit, :id =>1}
  end

  context 'GET index' do
    let(:user) {FactoryGirl.create(:user)}

    context 'with authorized session' do
      before {get :index, {}, {'user_id' => user.id}}
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
      let(:valid_attributes) {{:email => "plowry@scu.edu", :password => "abc1234", :password_confirmation => 'abc1234', :username => 'plowry'}}
      let(:valid_parameters) {{:user => valid_attributes}}

      it 'creates a new user' do
        expect {post :create, valid_parameters}.to change(User, :count).by(1) 
      end

      context 'before create' do 
        before {post :create, valid_parameters}
        it {should redirect_to root_path}
        it {should set_the_flash[:notice]}
        it {should set_session(:user_id)}
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:email => "", :password => "", :password_confirmation => '', :username => ''}}
      let(:invalid_parameters) {{:user => invalid_attributes}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert].to("There were errors creating your account.").now}
      it {should render_template :new}
    end
  end

  context 'GET edit' do
    let(:user) {FactoryGirl.create :user}
    before {get :edit, {:id => user.id}, {'user_id' => user.id}}

    it {should render_template :edit}
  end

  context 'GET show' do
    let(:user) {FactoryGirl.create :user}
    before {get :edit, {:id => user.id}, {'user_id' => user.id}}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:user) {FactoryGirl.create :user}

    context 'with valid parameters' do 
      let(:valid_attributes) {{:email => user.email, :username => 'new_name', :password => user.password, :password_confirmation => user.password_confirmation}}
      let(:valid_parameters) {{:id => user.id, :user => valid_attributes}}
      before {put :update, valid_parameters, 'user_id' => user.id}

      it 'updates the user attributes' do
        User.find(user.id).username.should eq valid_attributes[:username]
      end

      it {should set_the_flash[:notice].to("Your account was successfully updated.")}
      it {should redirect_to users_path}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:email => '', :username => '', :password => '', :password_confirmation => ''}}
      let(:invalid_parameters) {{:id => user.id, :user => invalid_attributes}}
      before {put :update, invalid_parameters, 'user_id' => user.id}

      it {should render_template :edit}
      it {should set_the_flash[:alert].to("There were errors updating your account.").now}
    end
  end

  context 'DELETE destroy' do 

    context 'with authorized session' do
      it 'destroys a user' do
        user = FactoryGirl.create :user
        expect {delete :destroy, {:id => user.id}, {:user_id => user.id}}.to change(User, :count).by(-1)
      end

      let(:user) {FactoryGirl.create(:user)}
      before {delete :destroy, {:id => user.id}, {'user_id' => user.id}}
      it {should redirect_to users_path}
    end

    context 'without authorized session' do
      
      it 'does not destroy a user' do
        user = FactoryGirl.create(:user)
        expect {delete :destroy, {:id => user.id}, {}}.to change(User, :count).by(0)
      end

      let(:user) {FactoryGirl.create(:user)}

      before {delete :destroy, {:id => user.id}, {}}
      it {should set_the_flash[:alert]}
      it {should redirect_to users_path}
    end
  end
end