require 'spec_helper'

describe OpeningsController do
	describe "GET new" do
		it "sets the @opening variable" do
			get :new
			expect(assigns(:opening)).to be_instance_of(Opening)
		end
	end
end