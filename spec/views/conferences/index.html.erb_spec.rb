require 'rails_helper'

RSpec.describe "conferences/index", :type => :view do
  before(:each) do
    assign(:conferences, [
      Conference.create!(
        :open => false,
        :number => "Number",
        :name => "Name"
      ),
      Conference.create!(
        :open => false,
        :number => "Number",
        :name => "Name"
      )
    ])
  end

  it "renders a list of conferences" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
