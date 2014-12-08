require 'rails_helper'

RSpec.describe "conferences/new", :type => :view do
  before(:each) do
    assign(:conference, Conference.new(
      :open => false,
      :number => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new conference form" do
    render

    assert_select "form[action=?][method=?]", conferences_path, "post" do

      assert_select "input#conference_open[name=?]", "conference[open]"

      assert_select "input#conference_number[name=?]", "conference[number]"

      assert_select "input#conference_name[name=?]", "conference[name]"
    end
  end
end
