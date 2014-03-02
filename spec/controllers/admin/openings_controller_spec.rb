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
				expect(response).to redirect_to openings_path
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

	describe "DELETE destory" do
		it_behaves_like "requires admin" do
			let (:action) { delete :destroy, id: 1 }
		end

		it "should destroy the opening" do
			set_current_admin
			opening = Fabricate(:opening)
			delete :destroy, id: opening.id
			expect(Opening.count).to eq(0)
		end

		it "redirects to the openings calendar" do
			set_current_admin
			opening = Fabricate(:opening)
			delete :destroy, id: opening.id
			expect(response).to redirect_to openings_path
		end
	end

	describe "GET edit" do
		before { set_current_admin }
		it_behaves_like "requires admin" do
			let(:action) { get :edit, id: 1 }
		end

		it "sets the @opening variable" do
			opening = Fabricate(:opening)
			get :edit, id: opening.id
			expect(assigns(:opening)).to be_present
		end
	end

	describe "PATCH update" do
		before { set_current_admin }
		it_behaves_like "requires admin" do
			let(:action) { patch :update, id: 1 }
		end

		it "updates the @opening" do
			@opening = Fabricate(:opening)
			patch :update, id: @opening.id, opening: {instruction: "Instructor Assisted Deployment"}
			expect(Opening.first.instruction).to eq("Instructor Assisted Deployment")
		end

		it "redirects to the opening show page" do
			@opening = Fabricate(:opening)
			patch :update, id: @opening.id, opening: {instruction: "Instructor Assisted Deployment"}
			expect(response).to redirect_to opening_path(@opening)
		end
	end
end