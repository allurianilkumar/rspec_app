require 'rails_helper'

class NumberCalculator
  def demo
    "Demo"
  end
end

RSpec.describe "Number Calculator", type: :view do
  it "Testing String" do
    expect(1).to eq(1)
  end
  it "Testing the Demo string" do
    number=NumberCalculator.new
    expect(number.demo).to eq("Demo")
  end
end
