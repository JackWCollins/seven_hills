require 'spec_helper'

describe Student do
	it { should have_many(:groups) }
	it { should have_one(:opening) }
end