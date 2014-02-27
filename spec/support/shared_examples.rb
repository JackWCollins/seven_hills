shared_examples "requires sign in" do
	it "redirects to the login page" do
		session[:user_id] = nil
		action
		expect(response).to redirect_to login_path
	end
end

shared_examples "requires member" do
	it "redirects to root_path" do
		session[:user_id] = Fabricate(:user).id
		action
		expect(response).to redirect_to root_path
	end
end

shared_examples "requires admin" do
	it "redirect_to members_path" do
		session[:user_id] = Fabricate(:admin).id
		action
		expect(response).to redirect_to members_path
	end
end