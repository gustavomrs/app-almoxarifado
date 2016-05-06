require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  before(:each) do
    assign(:entry, Entry.new(
      :amount => 1,
      :stuff => nil
    ))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "input#entry_amount[name=?]", "entry[amount]"

      assert_select "input#entry_stuff_id[name=?]", "entry[stuff_id]"
    end
  end
end
