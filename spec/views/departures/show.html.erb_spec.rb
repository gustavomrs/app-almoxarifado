require 'rails_helper'

RSpec.describe "departures/show", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
      :amount => 1,
      :stuff => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
