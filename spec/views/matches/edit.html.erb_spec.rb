require 'rails_helper'

RSpec.describe "matches/edit", type: :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :user_id => 1,
      :opponent_id => 1,
      :oppent_score => 1,
      :own_score => 1
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_user_id[name=?]", "match[user_id]"

      assert_select "input#match_opponent_id[name=?]", "match[opponent_id]"

      assert_select "input#match_oppent_score[name=?]", "match[oppent_score]"

      assert_select "input#match_own_score[name=?]", "match[own_score]"
    end
  end
end
