# frozen_string_literal: true

require "rails_helper"

describe Contest, type: :model do
  let(:contest) do
    create(:contest,
           number: Random.new.rand(999),
           theme: "Trivia Theme")
  end

  let!(:result) do
    create(:result,
           contest: contest,
           place: Random.new.rand(999))
  end

  it "has valid factory" do
    expect(contest).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:hours) }
    it { is_expected.to have_one(:result) }
  end

  describe "#standings" do
    let(:standing) { Contest.standings }

    # reset class variable
    before { Contest.last_completed = nil }

    it "returns string of results from last completed contest" do
      expect(standing).to include(result.place.to_s)
      expect(standing).to include(contest.number.to_s)
      expect(standing).to include(contest.theme)
    end
  end
end
