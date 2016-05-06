require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :amount => 1,
        :stuff => nil
      ),
      Entry.create!(
        :amount => 1,
        :stuff => nil
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
