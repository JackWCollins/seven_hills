require 'spec_helper'

describe StudentsController do
	describe "GET new" do
		it "sets the @student variable"
	end

	describe "POST create" do
		context "with logged in user" do
			it "redirects to the group page" do
				alice = Fabricate(:user)
				set_current_user(alice)
				group = Fabricate(:group)
				post :create, user: alice, group_id: group.id
				expect(response).to redirect_to group_path(group)
			end
			it "sets the flash success message" do
				alice = Fabricate(:user)
				set_current_user(alice)
				group = Fabricate(:group)
				post :create, user: alice, group_id: group.id
				expect(flash[:success]).to be_present
			end
			it "creates a user from the current_user params" do
				alice = Fabricate(:user)
				set_current_user(alice)
				group = Fabricate(:group)
				post :create, user: alice, group_id: group.id
				expect(Student.first.first_name).to eq(alice.first_name)
			end
			it "automatically adds the user to the group"
		end
		context "without logged in user" do
			context "with valid input" do

				it "redirects to the group page" do
					group = Fabricate(:group)
					post :create, student: Fabricate.attributes_for(:student), group_id: group.id
					expect(response).to redirect_to group_path(group)
				end

				it "sets the flash success message" do
					group = Fabricate(:group)
					post :create, student: Fabricate.attributes_for(:student), group_id: group.id
					expect(flash[:success]).to be_present
				end

				it "creates a student based on the form input" do
					group = Fabricate(:group)
					post :create, student: Fabricate.attributes_for(:student), group_id: group.id
					expect(Student.count).to eq(1)
				end

				it "adds the newly created student to the group"
			end

			context "with invalid input" do
				it "sets the flash danger message" do
					group = Fabricate(:group)
					post :create, student: {email: "jack@example.com"}, group_id: group.id
					expect(flash[:danger]).to be_present
				end
				it "renders the new template" do
					group = Fabricate(:group)
					post :create, student: {email: "jack@example.com"}, group_id: group.id
					expect(response).to render_template :new
				end
			end
		end
	end
end