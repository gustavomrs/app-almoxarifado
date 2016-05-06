require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :amount => 1,
      :stuff => nil
    ))
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "input#entry_amount[name=?]", "entry[amount]"

      assert_select "input#entry_stuff_id[name=?]", "entry[stuff_id]"
    end
  end
end
