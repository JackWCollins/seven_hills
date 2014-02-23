require 'spec_helper'

describe StudentsController do
	describe "GET new" do
		it "sets the @student variable"
	end

	describe "POST create" do
		context "with logged in user"
		context "without logged in user" do
			context "with valid input" do

				it "redirects to the reservation page" do
					reservation = Fabricate(:reservation)
					post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
					expect(response).to redirect_to reservation_path(reservation)
				end

				it "sets the flash success message" do
					reservation = Fabricate(:reservation)
					post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
					expect(flash[:success]).to be_present
				end

				it "creates a student based on the form input" do
					reservation = Fabricate(:reservation)
					post :create, student: Fabricate.attributes_for(:student), reservation_id: reservation.id
					expect(Student.count).to eq(1)
				end

				it "adds the newly created student to the reservation"
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
end