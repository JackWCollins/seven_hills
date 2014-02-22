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

	describe "POST create" do
		context "with valid input" do

			context "with logged in user" do
				it "redirects to the group show page" do 
					set_current_user
					post :create, group: Fabricate.attributes_for(:group)
					expect(response).to redirect_to group_path(assigns[:group])
				end

				it "sets the flash notice message" do
					set_current_user
					post :create, group: Fabricate.attributes_for(:group)
					expect(flash[:notice]).to be_present
				end

				it "creates a student from the currently signed in user" do
					alice = Fabricate(:user)
					set_current_user(alice)
					post :create, group: Fabricate.attributes_for(:group)
					expect(Student.count).to eq(1)
				end

				it "associates the signed in user as the contact person" do
					set_current_user
					post :create, group: Fabricate.attributes_for(:group)
					expect(Reservation.first.student).to eq(1)
				end
			end

			context "without logged in user" do
				it "redirects to the login path" do
					post :create, group: Fabricate.attributes_for(:group)
					expect(response).to redirect_to login_path
				end
				it "sets the flash danger" do
					post :create, group: Fabricate.attributes_for(:group)
					expect(flash[:danger]).to be_present
				end
			end

		end

		context "with invalid input" do
			it "sets the flash danger message" do
				set_current_user
				post :create, group: {instruction: "Tandem"}
				expect(flash[:danger]).to be_present
			end
			it "renders the new template" do
				set_current_user
				post :create, group: {instruction: "Tandem"}
				expect(response).to render_template :new
			end
		end
	end
end