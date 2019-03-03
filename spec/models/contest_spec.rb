# frozen_string_literal: true

require "rails_helper"

describe Contest, type: :model do
  it "has valid factory" do
    expect(create(:contest)).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:hours) }
    it { is_expected.to have_one(:result) }
  end

  describe "#standings" do
    it "returns string of results from last completed contest" do
      contest = create(:contest)
      result = create(:result, contest: contest)
      standing = Contest.standings

      expect(standing).to include(result.place.to_s)
      expect(standing).to include(contest.number.to_s)
      expect(standing).to include(contest.theme)
    end
  end
end
