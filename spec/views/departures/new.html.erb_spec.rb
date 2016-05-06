require 'rails_helper'

RSpec.describe "departures/new", type: :view do
  before(:each) do
    assign(:departure, Departure.new(
      :amount => 1,
      :stuff => nil
    ))
  end

  it "renders new departure form" do
    render

    assert_select "form[action=?][method=?]", departures_path, "post" do

      assert_select "input#departure_amount[name=?]", "departure[amount]"

      assert_select "input#departure_stuff_id[name=?]", "departure[stuff_id]"
    end
  end
end
