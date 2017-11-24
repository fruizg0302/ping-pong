require 'rails_helper'

RSpec.describe "matches/new", type: :view do
  before(:each) do
    assign(:match, Match.new(
      :user_id => 1,
      :opponent_id => 1,
      :oppent_score => 1,
      :own_score => 1
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_user_id[name=?]", "match[user_id]"

      assert_select "input#match_opponent_id[name=?]", "match[opponent_id]"

      assert_select "input#match_oppent_score[name=?]", "match[oppent_score]"

      assert_select "input#match_own_score[name=?]", "match[own_score]"
    end
  end
end
