require 'rails_helper'

RSpec.describe "matches/index", type: :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :user_id => 2,
        :opponent_id => 3,
        :oppent_score => 4,
        :own_score => 5
      ),
      Match.create!(
        :user_id => 2,
        :opponent_id => 3,
        :oppent_score => 4,
        :own_score => 5
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
