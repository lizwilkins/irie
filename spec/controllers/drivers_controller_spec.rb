require 'spec_helper'

describe DriversController do
  context 'routing' do
   it {should route(:get, '/drivers/new').to :action => :new}    
    it {should route(:post, '/drivers').to :action => :create}
    it {should route(:put, '/drivers/1').to :action => :update, :id => 1}
    it {should route(:delete, '/drivers/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/drivers').to :action => :index}
    it {should route(:get, '/drivers/1').to :action => :show, :id => 1}
    it {should route(:get, '/drivers/1/edit').to :action => :edit, :id =>1}
  end

  context 'GET new' do
    before {get :new}
    it {should render_template :new}
  end

  context 'GET index' do
    before {get :index}
    it {should render_template :index}

    it "assigns all drivers as @drivers" do
      driver = FactoryGirl.create(:driver)
      get :index
      assigns(:drivers).should eq([driver])
    end
  end

  context 'POST create' do
    context 'with valid params' do
      let(:valid_attrs) {{:supervisor => "Max", :user_id => 1}}
      let(:valid_params) {{:driver => valid_attrs}}
      it 'creates a new driver' do
        expect {post :create, valid_params}.to change(Driver, :count).by(1)
      end
    end
  end

  context 'GET edit' do
    let(:admin) {FactoryGirl.create(:admin)}
    let(:driver) {FactoryGirl.create(:driver)}
    context 'with authorized session' do
      before {get :edit, {:id => driver.id}, {'user_id' => admin.id}}
      it {should render_template :edit}
    end
    context 'with unauthorized session' do
      let(:user) {FactoryGirl.create(:user)}
      before {get :edit, {:id => driver.id}, {'user_id' => user.id}}
      it {should redirect_to root_path}
      it {should set_the_flash}
    end
  end

  context 'PUT update' do
    let(:driver) {FactoryGirl.create :driver}

    context 'with authorized session' do
      context 'with valid parameters' do 
        let(:valid_attrs) {{:supervisor => "Max", :user_id => 1}}
        let(:valid_params) {{:id => driver.id, :driver => valid_attrs}}
        before {put :update, valid_params, 'driver_id' => driver.id}

        it 'updates the driver attributes' do
          Driver.find(driver.id).supervisor.should eq valid_attrs[:supervisor]
        end

        it {should set_the_flash[:notice].to("The driver profile was successfully updated.")}
        it {should redirect_to drivers_path}
      end

      context 'with invalid parameters' do
        let(:invalid_attrs) {{:supervisor => "", :user_id => 1}}
        let(:invalid_params) {{:id => driver.id, :driver => invalid_attrs}}
        before {put :update, invalid_params, 'driver_id' => driver.id}

        it {should render_template :edit}
        it {should set_the_flash[:alert].to("There were errors updating the driver profile.").now}
      end
    end
  end

  context 'DELETE destroy' do
    let(:driver) {FactoryGirl.create(:driver)}

    context 'with authorized session' do
      before {driver}
      let(:admin) {FactoryGirl.create(:admin)}

      it 'destroys a driver' do
        expect {delete :destroy, {:id => driver.id}, {"user_id" => admin.id}}.to change(Driver, :count).by(-1)
      end
      
      it 'redirects to drivers path' do
        delete :destroy, {:id => driver.id}, {"user_id" => admin.id}
        should redirect_to drivers_path
      end
    end 

    context 'with unauthorized session' do
      before {driver}
      let(:user) {FactoryGirl.create(:user)}

      it "doesn't destroy a driver" do
        expect {delete :destroy, {:id => driver.id}, {"user_id" => user.id}}.to change(Driver, :count).by(0)
      end

      it "redirects to home page" do
        delete :destroy, {:id => driver.id}, {"user_id" => user.id}
        should redirect_to root_path
      end

    end
  end      
end