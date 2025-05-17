require 'rails_helper'

RSpec.describe "cats/show", type: :view do
  before(:each) do
    assign(:cat, Cat.create!(
      name: "Name",
      email: "Email",
      tel: "Tel"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Tel/)
  end
end
