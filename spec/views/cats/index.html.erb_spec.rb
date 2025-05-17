require 'rails_helper'

RSpec.describe "cats/index", type: :view do
  before(:each) do
    assign(:cats, [
      Cat.create!(
        name: "Name",
        email: "Email",
        tel: "Tel"
      ),
      Cat.create!(
        name: "Name",
        email: "Email",
        tel: "Tel"
      )
    ])
  end

  it "renders a list of cats" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tel".to_s), count: 2
  end
end
