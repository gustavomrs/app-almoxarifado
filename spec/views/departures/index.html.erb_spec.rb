require 'rails_helper'

RSpec.describe "departures/index", type: :view do
  before(:each) do
    assign(:departures, [
      Departure.create!(
        :amount => 1,
        :stuff => nil
      ),
      Departure.create!(
        :amount => 1,
        :stuff => nil
      )
    ])
  end

  it "renders a list of departures" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
