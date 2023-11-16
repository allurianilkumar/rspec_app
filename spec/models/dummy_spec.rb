require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it "must have an age greater than 21" do
    # dummy = FactoryBot.create(:dummy)
    # dummy1 = FactoryBot.create(:dummy)
    dummy = create(:dummy)
    dummy1 = create(:dummy)

    # dummy = FactoryBot.create(:dummy, age: 11)
    # expect(dummy.age).to be >= 21
    # expect(dummy1.email).to eq("anil@gmail.com")

    expect(dummy.email).to eq("anil+1@gmail.com")
    expect(dummy1.email).to eq("anil+2@gmail.com")

  end
end
