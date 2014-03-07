require 'spec_helper'

describe Opening do
	it { should validate_presence_of(:date)}
	it { should validate_presence_of(:time)}
	it { should validate_presence_of(:instruction)}

	describe "#search_by_date" do
		it "returns an empty array if there are no matches" do
			expect(Opening.search_by_date("03/20/2015")).to eq([])
		end
		it "returns an array of one opening if there is one match" do
			opening = Opening.create(instruction: "Tandem", date: DateTime.strptime("03/20/2015", "%m/%d/%Y").to_date, time: Date.new.to_time)
			expect(Opening.search_by_date("03/20/2015")).to eq([opening])
		end
		it "returns an array of all of the openings if there are three matches" do
			opening1 = Opening.create(instruction: "Tandem", date: DateTime.strptime("03/20/2015", "%m/%d/%Y").to_date, time: Date.new.to_time)
			opening2 = Opening.create(instruction: "Tandem", date: DateTime.strptime("03/20/2015", "%m/%d/%Y").to_date, time: Date.new.to_time)
			opening3 = Opening.create(instruction: "Tandem", date: DateTime.strptime("03/20/2015", "%m/%d/%Y").to_date, time: Date.new.to_time)
			expect(Opening.search_by_date("03/20/2015")).to eq([opening1, opening2, opening3])
		end
	end
end