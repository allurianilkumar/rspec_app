require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        firstname: "Firstname",
        lastname: "Lastname"
      ),
      Admin.create!(
        firstname: "Firstname",
        lastname: "Lastname"
      )
    ])
  end

  it "renders a list of admins" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Firstname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Lastname".to_s), count: 2
  end
end
