require 'spec_helper'

describe Group do
	it { should have_many(:students) }

end