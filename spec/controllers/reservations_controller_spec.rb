require 'spec_helper'

describe ReservationsController do
	describe "GET new" do
		it "sets the @reservation variable" do
			alice = Fabricate(:user)
			set_current_user(alice)
			get :new
			expect(assigns(:reservation)).to be_instance_of(Reservation)
		end
	end

	describe "POST create" do
		context "with valid input" do

			it "redirects to the find_reservation page" do 
				set_current_user
				post :create, reservation: Fabricate.attributes_for(:reservation)
				expect(response).to redirect_to reservation_path(1)
			end

			it "sets the flash notice message" do
				set_current_user
				post :create, reservation: Fabricate.attributes_for(:reservation)
				expect(flash[:notice]).to be_present
			end
		end
	end

	describe "POST search" do
		context "with valid group number" do

			it "redirects to the reservation path" do
				reservation = Fabricate(:reservation)
				post :search, reservation_id: reservation.id
				expect(response).to redirect_to reservation_path(reservation)
			end

			it "sets the @reservation variable" do
				reservation = Fabricate(:reservation)
				post :search, reservation_id: reservation.id
				expect(assigns[:reservation]).to be_instance_of(Reservation)
			end
		end

		context "with invalid group number" do
			it "should render the search template again" do
				reservation = Fabricate(:reservation)
				post :search, reservation_id: "34"
				expect(response).to render_template :find
			end

			it "should set the flash danger message" do
				reservation = Fabricate(:reservation)
				post :search, reservation_id: "34"
				expect(flash[:danger]).to be_present
			end
		end
	end
end