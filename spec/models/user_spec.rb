# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do

    describe "Calculations" do
        it "expect 1+2+3 to eq 6" do
            expect(1+2+3).to eql(6)
        end

        it "expect 1+2+3 to not eq 10" do
            expect(1+2+3).to_not eq(10)
        end

        it "expect true to be true" do
            expect(true).to be(true)
        end
    end

end
