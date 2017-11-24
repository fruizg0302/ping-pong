require 'rails_helper'
require 'byebug'

RSpec.describe Match, type: :model do
	let(:player1) {create(:random_user)}
	let(:player2) {create(:random_user)}

    it "returns a valid Match Object" do
      match = Match.new(player1.id, Time.now, player2.id, 19, 21)
      expect(match).to be_instance_of(Match)
    end
end
