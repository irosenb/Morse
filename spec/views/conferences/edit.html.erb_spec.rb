require 'rails_helper'

RSpec.describe "conferences/edit", :type => :view do
  before(:each) do
    @conference = assign(:conference, Conference.create!(
      :open => false,
      :number => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit conference form" do
    render

    assert_select "form[action=?][method=?]", conference_path(@conference), "post" do

      assert_select "input#conference_open[name=?]", "conference[open]"

      assert_select "input#conference_number[name=?]", "conference[number]"

      assert_select "input#conference_name[name=?]", "conference[name]"
    end
  end
end
