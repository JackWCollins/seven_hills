require 'spec_helper'

describe Admin::OpeningsController do
	describe "GET new" do
		it "sets the @opening variable" do
			set_current_admin
			get :new
			expect(assigns(:opening)).to be_instance_of(Opening)
		end
	end

	describe "POST create" do
		it_behaves_like "requires admin" do
		  let(:action) { post :create }
		end

		context "with valid input" do
			before { set_current_admin }

			it "redirects to the openings index page" do
				post :create, opening: { instruction: "Tandem", date: "03/06/2015", time: "12:30" }
				expect(response).to redirect_to admin_openings_path
			end

			it "creates an opening" do
				post :create, opening: { instruction: "Tandem", date: "03/06/2015", time: "12:30" }
				expect(Opening.count).to eq(1)
			end

			it "sets the flash success message" do
				post :create, opening: { instruction: "Tandem", date: "03/06/2015", time: "12:30" }
				expect(flash[:notice]).to be_present
			end
		end

		context "with invalid input" do
			before { set_current_admin }
			it "renders the new template" do
				post :create, opening: { instruction: "Tandem" }
				expect(response).to render_template :new
			end
			it "sets the flash danger message" do
				post :create, opening: { instruction: "Tandem" }
				expect(flash[:danger]).to be_present
			end
		end
	end

	describe "GET index" do
		it_behaves_like "requires admin" do
			let(:action) { get :index }
		end
	end
end