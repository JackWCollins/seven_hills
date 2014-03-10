require 'spec_helper'

describe Reservation do
	it { should belong_to :creator }
	it { should have_many :groups }
	it { should have_many :students }

	describe "#search_by_reservation_id" do
		it "should return an empty array with no input" do
			expect(Reservation.search_by_reservation_id("")).to eq([])
		end
		it "should return an emptry array if the reservation doesn't exist" do
			expect(Reservation.search_by_reservation_id(45)).to eq([])
		end
		it "should return the reservation object if the reservation exists" do
			reservation = Fabricate(:reservation)
			expect(Reservation.search_by_reservation_id(reservation.id)).to eq([reservation])
		end
	end
end