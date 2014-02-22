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
			it "redirects to the group page"
			it "sets the flash success message"
			it "creates a user based on the form input"
		end
	end
end