require 'rails_helper'

RSpec.describe "cats/edit", type: :view do
  let(:cat) {
    Cat.create!(
      name: "MyString",
      email: "MyString",
      tel: "MyString"
    )
  }

  before(:each) do
    assign(:cat, cat)
  end

  it "renders the edit cat form" do
    render

    assert_select "form[action=?][method=?]", cat_path(cat), "post" do

      assert_select "input[name=?]", "cat[name]"

      assert_select "input[name=?]", "cat[email]"

      assert_select "input[name=?]", "cat[tel]"
    end
  end
end
