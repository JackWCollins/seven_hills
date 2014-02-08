require 'spec_helper'

describe GroupsController do
	describe "GET new" do
		context "with logged in user" do
			it "sets the @group variable" do
				alice = Fabricate(:user)
				set_current_user(alice)
				get :new
				expect(assigns(:group)).to be_instance_of(Group)
			end
		end
		context "without logged in user" do
			it "redirects them to the register page" do
				get :new
				expect(response).to redirect_to register_path
			end
			it "sets the flash message" do
				get :new
				expect(flash[:success]).to be_present
			end
		end
	end
end