require 'spec_helper'

describe ReservationsController do
	describe "GET new" do
		context "with logged in user" do
			it "sets the @reservation variable" do
				alice = Fabricate(:user)
				set_current_user(alice)
				get :new
				expect(assigns(:reservation)).to be_instance_of(Reservation)
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
				it "redirects to the find_reservation page" do 
					set_current_user
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(response).to redirect_to reserve_openings_path(student_id: 1)
				end

				it "sets the flash notice message" do
					set_current_user
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(flash[:notice]).to be_present
				end

				it "creates a student from the currently signed in user" do
					alice = Fabricate(:user)
					set_current_user(alice)
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(Student.count).to eq(1)
				end

				it "associates the signed in user as the contact person" do
					alice = Fabricate(:user)
					set_current_user(alice)
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(Reservation.first.creator).to eq(alice)
				end
			end

			context "without logged in user" do
				it "redirects to the login path" do
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(response).to redirect_to login_path
				end
				it "sets the flash danger" do
					post :create, reservation: Fabricate.attributes_for(:reservation)
					expect(flash[:danger]).to be_present
				end
			end
		end
	end

	describe "POST search" do
		it "sets the flash error message if a reservation is not found"
		it "renders the find template if the reservation is found"
		it "redirects to the reservation if the reservation is found"
	end
end