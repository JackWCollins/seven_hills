require 'spec_helper'

describe StudentsController do
	describe "GET new" do
		it "sets the @student variable" do
			reservation = Fabricate(:reservation)
			get :new, reservation_id: reservation.id
			expect(assigns(:student)).to be_instance_of(Student) 
		end

		it "sets the @reservation variable" do
			reservation = Fabricate(:reservation)
			get :new, reservation_id: reservation.id
			expect(assigns(:reservation)).to be_instance_of(Reservation) 
		end
	end

	describe "POST create" do
		context "with valid input" do

			it "redirects to the reservation page" do
				reservation = Fabricate(:reservation)
				post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
				expect(response).to redirect_to reservation_path(reservation)
			end

			it "sets the flash notice message" do
				reservation = Fabricate(:reservation)
				post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
				expect(flash[:notice]).to be_present
			end

			it "creates a student based on the form input" do
				reservation = Fabricate(:reservation)
				post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
				expect(Student.count).to eq(1)
			end

			it "adds the newly created student to the reservation" do
				reservation = Fabricate(:reservation)
				post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
				expect(reservation.reload.students.count).to eq(1)
			end
		end

		context "with invalid input" do
			it "sets the flash danger message" do
				reservation = Fabricate(:reservation)
				post :create, student: {email: "jack@example.com"}, reservation_id: reservation.id
				expect(flash[:danger]).to be_present
			end
			it "renders the new template" do
				reservation = Fabricate(:reservation)
				post :create, student: {email: "jack@example.com"}, reservation_id: reservation.id
				expect(response).to render_template :new
			end

			it "does not create a student" do
				reservation = Fabricate(:reservation)
				post :create, student: {email: "jack@example.com"}, reservation_id: reservation.id
				expect(Student.count).to eq(0)
			end
		end
	end
end