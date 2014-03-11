require 'spec_helper'

describe OpeningsController do
	describe "GET show" do
		it "sets the @opening variable" do
			opening = Fabricate(:opening)
			get :show, id: opening.id
			expect(assigns(:opening)).to be_instance_of(Opening)
		end
	end

	describe "POST roster" do
		it_behaves_like "requires member" do
			let(:action) { post :roster, date: "05/26/2015"}
		end

		it "renders to the roster page" do
			set_current_member
			post :roster, date: "05/26/2015"
			expect(response).to render_template :roster
		end

		it "sets the @date variable" do
			set_current_member
			post :roster, date: "05/26/2015"
			expect(assigns(:date)).to be_present
		end

		it "sets the @openings variable" do
			set_current_member
			post :roster, date: "05/26/2015"
			expect(assigns(:openings)).to eq([])
		end

		it "sets the @tandem_openings variable" do
			set_current_member
			tandem = Fabricate(:opening, instruction: "Tandem", reserved: true)
			post :roster, date: "05/26/2015"
			expect(assigns(:tandem_openings)).to eq([tandem])
		end

		it "sets the @iad_openings variable" do
			set_current_member
			iad = Fabricate(:opening, instruction: "Instructor Assisted Deployment", reserved: true)
			post :roster, date: "05/26/2015"
			expect(assigns(:iad_openings)).to eq([iad])
		end

		it "sets the @unfilled_openings variable" do
			set_current_member
			unfilled = Fabricate(:opening)
			post :roster, date: "05/26/2015"
			expect(assigns(:unfilled_openings)).to eq([unfilled])
		end
	end
end