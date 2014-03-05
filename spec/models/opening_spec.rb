require 'spec_helper'

describe Opening do
	it { should validate_presence_of(:date)}
	it { should validate_presence_of(:time)}
	it { should validate_presence_of(:instruction)}
end