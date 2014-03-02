require 'spec_helper'

describe OpeningsController do
	describe "GET show" do
		it "sets the @opening variable" do
			opening = Fabricate(:opening)
			get :show, id: opening.id
			expect(assigns(:opening)).to be_instance_of(Opening)
		end
	end
end