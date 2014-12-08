require 'rails_helper'

RSpec.describe "conferences/show", :type => :view do
  before(:each) do
    @conference = assign(:conference, Conference.create!(
      :open => false,
      :number => "Number",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Name/)
  end
end
