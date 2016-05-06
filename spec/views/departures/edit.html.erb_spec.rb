require 'rails_helper'

RSpec.describe "departures/edit", type: :view do
  before(:each) do
    @departure = assign(:departure, Departure.create!(
      :amount => 1,
      :stuff => nil
    ))
  end

  it "renders the edit departure form" do
    render

    assert_select "form[action=?][method=?]", departure_path(@departure), "post" do

      assert_select "input#departure_amount[name=?]", "departure[amount]"

      assert_select "input#departure_stuff_id[name=?]", "departure[stuff_id]"
    end
  end
end
